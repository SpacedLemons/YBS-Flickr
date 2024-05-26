import SwiftUI

struct PhotoGridView: View {
    let items: [Item]
    @State private var selectedPhoto: Item?

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: .columns, spacing: 10) {
                    ForEach(items) { item in
                        AsyncImage(url: URL(string: item.imageURL)) { image in
                            image
                                .resizable()
                                .clipped()
                                .frameSquare(size: 110)
                                .onTapGesture { selectedPhoto = item }
                        } placeholder: { ProgressView() }
                    }
                }
                .padding()
            }
            .fullScreenCover(item: $selectedPhoto) { item in
                PhotoDetailView(item: item)
            }
        }
    }
}
