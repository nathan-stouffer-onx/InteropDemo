import UIKit
import Metal

import onyx

class OnyxViewController: UIViewController {

    var device: MTLDevice!
    var metalLayer: CAMetalLayer!
	
	var timer: CADisplayLink!
	
	var pointers: Array<UITouch?> = Array(repeating: nil, count: 4)
    
    func token() -> String {
        let filePath = Bundle.main.path(forResource: "token", ofType: "txt")
        let URL = NSURL.fileURL(withPath: filePath!)
        do {
            let string = try String.init(contentsOf: URL)
            return string
        } catch  {
            print(error);
        }
        return ""
    }
    
    deinit {
        onyx.shutdown()
    }
            
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//		// iterate over the touches, assigning them the first available id and setting them as down
//		for touch in touches {
//			for (i, p) in pointers.enumerated() {
//				if (p == nil) {
//					pointers[i] = touch
//					let location = touch.location(in: view)
//					let x = (location.x / metalLayer.frame.width) * 2.0 - 1.0
//					// offset by 20 to account for status bar offset
//					let y = ((location.y - 20) / metalLayer.frame.height) * 2.0 - 1.0
//					setPointerPosition(UInt32(i), Float(x), Float(y), Float(touch.force))
//					setPointerDown(UInt32(i))
//					break;
//				}
//			}
//		}
//    }
//    
//    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//		// iterate over touches, checking their id, setting the pointer as up, and marking the id as available
//		for touch in touches {
//			for (i, p) in pointers.enumerated() {
//				if (p == touch) {
//					pointers[i] = nil
//					let location = touch.location(in: view)
//					let x = (location.x / metalLayer.frame.width) * 2.0 - 1.0
//					// offset by 20 to account for status bar offset
//					let y = ((location.y - 20) / metalLayer.frame.height) * 2.0 - 1.0
//					setPointerPosition(UInt32(i), Float(x), Float(y), Float(touch.force))
//					setPointerUp(UInt32(i))
//					break;
//				}
//			}
//		}
//    }
//    
//    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
//		// iterate over the touches, find the id, and move the appropriate pointer
//		for touch in touches {
//			for (i, p) in pointers.enumerated() {
//				if (p == touch) {
//					let location = touch.location(in: view)
//					let x = (location.x / metalLayer.frame.width) * 2.0 - 1.0
//					// offset by 20 to account for status bar offset
//					let y = ((location.y - 20) / metalLayer.frame.height) * 2.0 - 1.0
//					setPointerPosition(UInt32(i), Float(x), Float(y), Float(touch.force))
//					break;
//				}
//			}
//		}
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.isMultipleTouchEnabled = true
        device = MTLCreateSystemDefaultDevice()
        
        metalLayer = CAMetalLayer()
        metalLayer.device = device
        metalLayer.pixelFormat = .bgra8Unorm
        metalLayer.framebufferOnly = true
        metalLayer.frame = view.bounds
        metalLayer.backgroundColor = UIColor.red.cgColor
        
        view.layer.addSublayer(metalLayer)
        
		setupMapViewer();
		
		timer = CADisplayLink(target: self, selector: #selector(gameloop))
		timer.add(to: RunLoop.main, forMode: .default)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        // offset by view.safeAreaInsets.top to avoid being underneath the status bar, dynamic island, notch, etc...
        metalLayer.frame = CGRect(x: 0, y: view.safeAreaInsets.top, width: view.bounds.width, height: view.bounds.height - view.safeAreaInsets.top)
    }
    
    func render() {
        onyx.render()
        metalLayer.setNeedsDisplay()
        metalLayer.display()
    }

    @objc func gameloop() {
      autoreleasepool {
        self.render()
      }
    }
    
	func setupMapViewer() {
        onyx.setToken(std.string(token()))
        
        let unsafeMetalLayer = UnsafeMutableRawPointer(Unmanaged.passRetained(metalLayer).toOpaque())
        let unsafeMetalDevice = UnsafeMutableRawPointer(Unmanaged.passRetained(device).toOpaque())
        guard let bundle = Bundle(path: Bundle.main.bundlePath + "/TestOnyxPackage_Assets.bundle")?.bundlePath else {
                    print("Failed to find assets path")
                    return
                }
        onyx.initialize(UInt32(metalLayer.frame.width), UInt32(metalLayer.frame.height), unsafeMetalLayer, unsafeMetalDevice, std.string(bundle + "/"))
    }
    
    
}
