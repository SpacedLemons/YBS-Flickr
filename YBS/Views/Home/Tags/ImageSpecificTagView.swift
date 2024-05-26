import SwiftUI

struct ImageSpecificTagView: View {
    let tag: String
    @StateObject var viewModel = PhotosViewModel()

    var body: some View {
        NavigationView {
            VStack {
                Text(tag)
                    .font(.caption).bold()
                    .frame(alignment: .center)
                    .padding(8)
                    .padding(.horizontal, 8)
                    .background(Color.backgroundGray)
                    .overlay(
                        Rectangle()
                            .stroke(Color.black, lineWidth: 4)
                    )
                Spacer()
                if viewModel.items.isEmpty {
                    ProgressView()
                } else {
                    PhotoGridView(items: viewModel.items)
                }
            }
            .padding(.top, 40)
            .onAppear { Task { await viewModel.searchPhotosByTag(tag: tag)} }
        }
    }
}
