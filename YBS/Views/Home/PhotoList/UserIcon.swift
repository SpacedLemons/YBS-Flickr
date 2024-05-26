import SwiftUI

struct UserIcon: View {
    let authorID: String
    let iconURL: String
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: iconURL)) { image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: { ProgressView() }
                .frameSquare(size: 50)
                .clipShape(Circle())
            
            Text(authorID)
                .font(.caption)
                .foregroundColor(Color.contentPrimary)
                .frame(alignment: .leading)
                .padding(.vertical, 8)
                .padding(.horizontal, 10)
                .background(Color.backgroundGreen)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.accentColor, lineWidth: 2)
                )
        }
    }
}
