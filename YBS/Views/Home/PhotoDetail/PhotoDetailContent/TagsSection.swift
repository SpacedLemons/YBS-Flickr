import SwiftUI

struct TagsSection: View {
    let tags: String

    var body: some View {
        VStack(alignment: .leading) {
            Text("Tags: ").bold()
            LazyVGrid(columns: .columns, spacing: 8) {
                ForEach(tags.split(separator: " ").map(String.init), id: \.self) { tag in
                    TagStyleView(tag: tag)
                }
                Spacer()
            }
            Divider()
                .frame(height: 4)
                .background(Color.black)
        }
    }
}
