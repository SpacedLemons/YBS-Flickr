import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    @ObservedObject var viewModel: SearchViewModel
    
    var body: some View {
        HStack {
            TextField("Search", text: .constant(text))
                .disabled(true)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.leading, 8)
            Button(action: { viewModel.isSearchParametersPresented.toggle() }) {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                    .padding(.trailing, 8)
            }
        }
        .background(Color(.systemGray6))
        .cornerRadius(10)
        .contentShape(Rectangle())
        .fullScreenCover(isPresented: $viewModel.isSearchParametersPresented) {
            SearchParametersView(viewModel: viewModel)
        }
    }
}
