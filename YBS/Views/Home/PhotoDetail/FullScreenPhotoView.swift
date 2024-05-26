import SwiftUI

struct FullScreenPhotoView: View {
    let photo: Item
    @Environment(\.presentationMode) var presentationMode
    @State private var currentScale = 1.0
    @State private var finalScale = 1.0
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Color.black.edgesIgnoringSafeArea(.all)
            AsyncImage(url: URL(string: photo.imageURL)) { image in
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
                    .gesture( TapGesture(count: 2) .onEnded { withAnimation { finalScale = finalScale > 1.0 ? 1.0 : 2.0 } } )
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            } placeholder: { ProgressView() }
            Button(action: { dismiss() }) {
                Image(systemName: "xmark.circle.fill")
                    .font(.largeTitle)
                    .padding()
            }
        }
        .background(Color.backgroundGray)
    }
    
    private func dismiss() { presentationMode.wrappedValue.dismiss() }
}
