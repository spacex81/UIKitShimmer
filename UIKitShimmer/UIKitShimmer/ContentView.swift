import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            ShimmeringViewControllerRepresentable()
                .frame(width: 200, height: 50) // Adjust the frame size as needed
                .padding()
        }
    }
}
