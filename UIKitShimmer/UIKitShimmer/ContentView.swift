import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            ShimmeringViewControllerRepresentable(text: "Fuck You", font: UIFont.boldSystemFont(ofSize: 24), fontSize: 24)
                .frame(width: 200, height: 50) // Adjust the frame size as needed
                .padding()
        }
    }
}

#Preview {
    ContentView()
        .preferredColorScheme(.dark)
}
