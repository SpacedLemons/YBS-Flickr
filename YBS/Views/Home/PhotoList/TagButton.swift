import SwiftUI

struct TagButton: View {
    let disabled: Bool
    
    var body: some View {
        Text("Tags")
            .font(.headline)
            .foregroundColor(disabled ? Color.gray : Color.contentPrimary)
            .padding(.vertical, 8)
            .padding(.horizontal, 20)
            .background(disabled ? Color.gray.opacity(0.2) : Color.backgroundGreen)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(disabled ? Color.gray : Color.accentColor, lineWidth: 2)
            )
    }
}
