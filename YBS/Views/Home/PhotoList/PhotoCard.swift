import SwiftUI

struct PhotoCard: View {
    let item: Item
    @ObservedObject var viewModel: PhotosViewModel

    var body: some View {
        VStack(alignment: .center) {
            AsyncImage(url: URL(string: item.imageURL)) { image in
                image.resizable()
            } placeholder: { ProgressView() }
                .frame(width: 420, height: 320)
                .onTapGesture { viewModel.selectPhoto(item) }
            
            HStack {
                Button(action: { viewModel.selectUserID(item.authorID) }) {
                    UserIcon(authorID: item.authorID, iconURL: item.iconURL)
                }
                Spacer()
                Button(action: { viewModel.selectTags(item.tags) }) {
                    TagButton(disabled: item.tags.isEmpty)
                }
                .disabled(item.tags.isEmpty)
            }
            .padding([.leading, .trailing, .bottom, .top], 14)
        }
        CustomDivider()
    }
}
