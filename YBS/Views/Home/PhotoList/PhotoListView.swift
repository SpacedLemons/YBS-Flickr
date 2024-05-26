import SwiftUI

struct PhotoListView: View {
    @StateObject private var viewModel = PhotosViewModel()
        
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.items) { item in
                        PhotoCard(item: item, viewModel: viewModel)
                    }
                }
            }
            .refreshable { await viewModel.fetchPhotos() }
            .navigationTitle("Flickr Photos")
            .sheet(isPresented: $viewModel.isShowingUserPhotos) {
                NavigationStack {
                    UserPhotosView(
                        userID: viewModel.selectedUserID ?? "",
                        viewModel: viewModel
                    )
                    .environmentObject(viewModel)
                }
            }
            .sheet(item: $viewModel.selectedTags) { tagWrapper in
                TagsSheetView(tags: tagWrapper.tags)
            }
            .fullScreenCover(item: $viewModel.selectedPhoto) { photo in
                PhotoDetailView(item: photo)
            }
        }
    }
}
