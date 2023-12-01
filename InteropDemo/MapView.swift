import SwiftUI
import UIKit

struct MapView : UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        return MapViewController()
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
    }
    
    typealias UIViewControllerType = UIViewController
    
}

