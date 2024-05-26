import SwiftUI

struct PhotoDetailView: View {
    let item: Item
    @State private var isShowingFullScreen = false
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .center) {
                    AsyncImage(url: URL(string: item.imageURL)) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .onTapGesture { isShowingFullScreen = true }
                    } placeholder: { ProgressView() }
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity)
                        .fullScreenCover(isPresented: $isShowingFullScreen) { FullScreenPhotoView(photo: item) }
                    
                    if !isShowingFullScreen { PhotoDetailContent(item: item) }
                }
                .padding()
            }
            .navigationTitle("Photo Details")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: { dismiss() }) {
                        HStack {
                            Image(systemName: "chevron.left")
                            Text("Back")
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    let dummyPhoto = Item(
        title: "Dummy Photo Title",
        link: "https://www.flickr.com",
        media: Media(url: "https://picsum.photos/id/237/200/300"),
        dateTaken: "2023-05-23",
        description: "This is a great dummy description made so I can test the UI using SwiftUI Previews!",
        published: "2023-05-23",
        author: "nobody@flickr.com (\"jsquare0299\")",
        authorID: "Author here!",
        tags: "tag1 tag2 tag3tag4tag5"
    )
    
    return PhotoDetailView(item: dummyPhoto)
}
