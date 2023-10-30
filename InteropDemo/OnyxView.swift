import SwiftUI
import UIKit

struct OnyxView : UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        return OnyxViewController()
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
    }
    
    typealias UIViewControllerType = UIViewController
    
}
