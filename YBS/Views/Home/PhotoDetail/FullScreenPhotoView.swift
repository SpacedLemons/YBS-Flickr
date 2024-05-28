import SwiftUI

struct FullScreenPhotoView: View {
    let photo: Item
    @Environment(\.dismiss) var dismiss
    @State private var currentScale = 1.0
    @State private var finalScale = 1.0
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Color.black.edgesIgnoringSafeArea(.all)
            AsyncImage(url: URL(string: photo.imageURL), content: { image in
                image
                    .resizable()
                    .scaledToFit()
                    .scaleEffect(currentScale * finalScale)
                    .gesture(
                        MagnificationGesture()
                            .onChanged { value in currentScale = value }
                            .onEnded { value in
                                finalScale = max(1.0, finalScale * value)
                                currentScale = 1.0
                            }
                    )
                    .gesture(TapGesture(count: 2).onEnded { withAnimation { finalScale = finalScale > 1.0 ? 1.0 : 2.0 } })
                    .contextMenu { imageShareOptions(url: photo.imageURL) }
            }, placeholder: { ProgressView() }
            )
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            DismissButton(action: { dismiss() })
        }
    }
}

extension FullScreenPhotoView {
    @ViewBuilder
    func imageShareOptions(url: String) -> some View {
        Button("Copy Image") { copyImage(url: url) }
        Button("Download Image") { downloadImage(url: url) }
    }
    
    private func copyImage(url: String) {
        if let url = URL(string: url),
           let imageData = try? Data(contentsOf: url),
           let uiImage = UIImage(data: imageData) {
            UIPasteboard.general.image = uiImage
        }
    }
    
    private func downloadImage(url: String) {
        guard
            let url = URL(string: url),
            let imageData = try? Data(contentsOf: url),
            let uiImage = UIImage(data: imageData) else { return }
        UIImageWriteToSavedPhotosAlbum(uiImage, nil, nil, nil)
    }
}
