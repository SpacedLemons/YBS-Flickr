import SwiftUI

struct SearchView: View {
    @StateObject private var viewModel = SearchViewModel(service: FlickrService())
    @State private var isShowingSearchParameters = false
    
    var body: some View {
        NavigationView {
            VStack {
                Button(action: { isShowingSearchParameters.toggle() }) {
                    HStack {
                        Image(systemName: "magnifyingglass")
                        Text(viewModel.tags)
                            .foregroundColor(.primary)
                        Spacer()
                    }
                    .padding()
                    .background(Color.backgroundGray)
                    .cornerRadius(8)
                }
                
                if viewModel.items.isEmpty {
                    ProgressView()
                } else {
                    PhotoGridView(items: viewModel.items)
                }
            }
            .navigationTitle("Flickr Search")
            .task { await viewModel.performSearch() }
            .sheet(isPresented: $isShowingSearchParameters) {
                SearchParametersView(viewModel: viewModel)
                    .presentationDragIndicator(.visible)
            }
        }
    }
}
