import SwiftUI

struct TagStyleView: View {
    let tag: String
    @State private var showFullTagSheet = false
    @State private var navigateToTagView = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Text(truncatedTag(tag))
                    .font(.caption).bold()
                    .padding(8)
                    .padding(.horizontal, 8)
                    .frame(maxWidth: .infinity)
                    .background(Color.backgroundGray)
                    .overlay(
                        Rectangle()
                            .stroke(Color.black, lineWidth: 4)
                    )
                    .onTapGesture { navigateToTagView = true }
                    .onLongPressGesture { if isTruncated(tag) { showFullTagSheet.toggle() } }
            }
            .sheet(isPresented: $showFullTagSheet) {
                FullTagSheet(tag: tag)
                    .presentationDetents([.fraction(0.2)])
                    .presentationDragIndicator(.visible)
            }
            
            .sheet(isPresented: $navigateToTagView) { ImageSpecificTagView(tag: tag) }
        }
    }
    
    private func truncatedTag(_ tag: String) -> String { tag.count > 8 ? String(tag.prefix(8)) + "..." : tag }
    private func isTruncated(_ tag: String) -> Bool { tag.count > 8 }
}

#Preview { TagStyleView(tag: "Hello") }
