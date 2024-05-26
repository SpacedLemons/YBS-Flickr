import SwiftUI

struct CustomDivider: View {
    var body: some View {
        Rectangle()
            .fill(Color.black)
            .frame(height: 2)
            .edgesIgnoringSafeArea(.horizontal)
    }
}
