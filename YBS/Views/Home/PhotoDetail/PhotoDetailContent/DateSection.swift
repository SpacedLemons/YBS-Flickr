import SwiftUI

struct DateSection: View {
    let title: String?
    let text: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            if let title = title {
                HStack {
                    Text(title).bold()
                    Spacer()
                    Text(text)
                }
            } else {
                Text(text).bold()
                    .font(.title)
            }
            Divider()
                .frame(height: 4)
                .background(Color.black)
        }
    }
}
