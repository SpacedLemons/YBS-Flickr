import SwiftUI

struct DescriptionSection: View {
    let title: String
    
    var body: some View {
        VStack(alignment: .center, spacing: 16) {
            Text(title).font(.headline)
                .fontWeight(.regular)
            Divider()
                .frame(height: 4)
                .background(Color.black)
        }
        .multilineTextAlignment(.center)
        .frame(maxWidth: .infinity)
    }
}
