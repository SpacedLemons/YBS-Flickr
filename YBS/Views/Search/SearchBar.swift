import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    let onTap: () -> Void

    var body: some View {
        HStack {
            TextField("Search", text: .constant(text))
                .disabled(true)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.leading, 8)
            Button(action: onTap) {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                    .padding(.trailing, 8)
            }
        }
        .background(Color(.systemGray6))
        .cornerRadius(10)
        .contentShape(Rectangle())
        .onTapGesture { onTap() }
    }
}
