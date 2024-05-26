import SwiftUI

struct FullTagSheet: View {
    let tag: String

    var body: some View {
        VStack {
            Spacer()
            Text(tag)
                .font(.caption).bold()
                .padding(8)
                .padding(.horizontal, 8)
                .overlay(
                    Rectangle()
                        .stroke(Color.black, lineWidth: 4)
                        .background(Color.gray.opacity(0.2))
                )
                .padding()
            Spacer()
        }
    }
}

#Preview { FullTagSheet(tag: "ThisIsALargeExampleTag") }
