import SwiftUI

struct UserPhotosView: View {
    let userID: String

    @ObservedObject var viewModel: PhotosViewModel
    @State private var userPhotos: [Item] = []
    
    var body: some View {
        VStack {
            Text("\(userID)'s photos").font(.title3)
                .bold()
                .padding(.top, 16)
            if userPhotos.isEmpty {
                ProgressView()
            } else {
                PhotoGridView(items: userPhotos)
            }
        }
        .task { await viewModel.fetchUserPhotos(userID: userID) }
        .onReceive(viewModel.$userPhotos) { newPhotos in
            userPhotos = newPhotos
        }
        .padding()
    }
}
