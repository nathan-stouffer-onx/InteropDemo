import UIKit

import OnyxMap

class MapViewController : UIViewController {
    
    var onyxView: OnyxView!
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        onyxView = OnyxView(frame: view.bounds, prefix: Self.prefix()!, token: Self.token()!)
        view.addSubview(onyxView)
        NSLayoutConstraint.activate([
            onyxView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            onyxView.topAnchor.constraint(equalTo: view.topAnchor),
            onyxView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            onyxView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    static func prefix() -> String? {
        let bundle = Bundle(path: Bundle.main.bundlePath + "/TestOnyxPackage_Assets.bundle")
        return bundle?.bundlePath ?? nil
    }
    
    static func token() -> String? {
        let filePath = Bundle.main.path(forResource: "tokens/production", ofType: "txt")
        let URL = NSURL.fileURL(withPath: filePath!)
        do {
            let string = try String.init(contentsOf: URL)
            return string
        } catch  {
            print(error);
        }
        return nil
    }
    
}
