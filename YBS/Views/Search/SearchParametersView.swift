import SwiftUI

struct SearchParametersView: View {
    @ObservedObject var viewModel: SearchViewModel
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Search Criteria")) {
                    TextField("Tags (comma separated)", text: $viewModel.tags)
                    TextField("User ID", text: $viewModel.username)
                    Toggle(isOn: $viewModel.matchAllTags) {
                        Text(viewModel.matchAllTags ? "Match All Tags" : "Match Any Tags")
                    }
                    Picker("Safe Search", selection: $viewModel.safeSearch) {
                        Text("Safe").tag(1)
                        Text("Moderate").tag(2)
                        Text("Restricted").tag(3)
                    }
                }
            }
            .navigationBarTitle("Search Parameters", displayMode: .inline)
            .navigationBarItems(
                leading: Button("Clear All") { clearAllParameters() },
                trailing: Button("Done") {
                    Task {
                        await viewModel.performSearch()
                        dismiss()
                    }
                }
            )
        }
    }
    
    private func dismiss() { presentationMode.wrappedValue.dismiss() }
    
    private func clearAllParameters() {
        viewModel.tags = ""
        viewModel.username = ""
        viewModel.matchAllTags = false
        viewModel.safeSearch = 1
    }
}
