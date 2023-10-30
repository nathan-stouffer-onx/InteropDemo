import SwiftUI
import Metal

import onyx

struct ContentView: View {
    
    static func window() -> CAMetalLayer {
        let layer = CAMetalLayer()
        layer.pixelFormat = .bgra8Unorm
        layer.framebufferOnly = true
        layer.backgroundColor = UIColor.red.cgColor
        return layer
    }
    
    var device: MTLDevice! = MTLCreateSystemDefaultDevice()
    var metalLayer: CAMetalLayer! = window()
    
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
    
    func initialize() {
        metalLayer.device = device
        let unsafeMetalLayer = UnsafeMutableRawPointer(Unmanaged.passRetained(metalLayer).toOpaque())
        let unsafeMetalDevice = UnsafeMutableRawPointer(Unmanaged.passRetained(device).toOpaque())

        guard let bundle = Bundle(path: Bundle.main.bundlePath + "/TestOnyxPackage_Assets.bundle")?.bundlePath else {
            print("Failed to find assets path")
            return
        }
        
        onyx.setToken(std.string(token()))
        onyx.initialize(90, 90, unsafeMetalLayer, unsafeMetalDevice, std.string(bundle + "/"))
    }
    func shutdown() {
        onyx.shutdown()
    }
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Button(action: initialize, label: {
                Text("initiliaze")
            })
            Button(action: shutdown, label: {
               Text("shutdown")
            })
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
