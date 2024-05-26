import SwiftUI

struct TagsSheetView: View {
    let tags: String
    @State private var selectedTag: String?
    
    private var tagsArray: [String] {
        tags.split(separator: " ")
            .map(String.init)
            .filter { !$0.isEmpty }
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Tags")
                    .font(.headline)
                    .padding()
                
                ScrollView {
                    if tagsArray.isEmpty {
                        VStack {
                            Text("No tags found!")
                                .font(.headline)
                                .padding()
                        }
                    } else {
                        LazyVGrid(columns: .columns, spacing: 8) {
                            ForEach(tagsArray, id: \.self, content: TagStyleView.init)
                        }
                        .padding(8)
                    }
                }
            }
            .padding()
        }
    }
}
