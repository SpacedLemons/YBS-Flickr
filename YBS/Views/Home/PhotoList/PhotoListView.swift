import SwiftUI

struct PhotoListView: View {
    @StateObject private var viewModel = PhotosViewModel(service: FlickrService())
        
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
                }
            }
            .sheet(item: $viewModel.selectedTags) { tagWrapper in
                TagsSheetView(tags: tagWrapper.tags)
            }
            .fullScreenCover(item: $viewModel.selectedPhoto, content: PhotoDetailView.init)
        }
    }
}
