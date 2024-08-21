import SwiftUI

struct ShimmeringViewControllerRepresentable: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> ShimmeringViewController {
        return ShimmeringViewController()
    }
    
    func updateUIViewController(_ uiViewController: ShimmeringViewController, context: Context) {
        // Update the view controller if needed
    }
}
