import SwiftUI

struct TitleSection: View {
    let title: String
    
    var body: some View {
        VStack(alignment: .center, spacing: 16) {
            Text(title).font(.title2)
                .bold()
            Divider()
                .frame(height: 4)
                .background(Color.black)
        }
        .multilineTextAlignment(.center)
        .frame(maxWidth: .infinity)
    }
}
