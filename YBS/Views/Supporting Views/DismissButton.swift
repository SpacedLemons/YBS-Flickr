import SwiftUI

struct DismissButton: View {
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Image(systemName: "xmark.circle.fill")
                .font(.largeTitle)
                .padding()
        }
    }
}
