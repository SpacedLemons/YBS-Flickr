import SwiftUI

struct AuthorSection: View {
    let author: String
    @Namespace private var animation
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Text("Author:").bold()
                Spacer()
                VStack(alignment: .trailing) {
                    Text(extractEmail(from: author))
                    Text(extractUserID(from: author))
                }
            }
            Divider()
                .frame(height: 4)
                .background(Color.black)
        }
    }
    
    private func extractEmail(from author: String) -> String {
        author.components(separatedBy: " ").first ?? author
    }
    
    private func extractUserID(from author: String) -> String {
        if
            let userIDStart = author.range(of: "\"")?.upperBound,
            let userIDEnd = author.range(of: "\"", range: userIDStart..<author.endIndex)?.lowerBound {
            let userID = author[userIDStart..<userIDEnd]
            return String(userID)
        }
        return author
    }
}
