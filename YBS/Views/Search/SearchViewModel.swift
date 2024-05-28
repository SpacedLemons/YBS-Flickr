import Foundation

final class SearchViewModel: ObservableObject {
    @Published var tags = "Yorkshire"
    @Published var username = ""
    @Published var matchAllTags = false
    @Published var items: [Item] = []
    @Published var safeSearch = 1
    @Published var lastSearchType = ""
    @Published var lastSearchValue = ""
    @Published var errorMessage: String? = nil
    
    @MainActor private let service: FlickrServiceProtocol
    
    init(service: FlickrServiceProtocol) {
        self.service = service
    }

    @MainActor
    func performSearch() async {
        lastSearchType = username.isEmpty ? "tag" : "user"
        lastSearchValue = username.isEmpty ? tags : username
        do {
            if !username.isEmpty {
                items = try await service.fetchUserPhotos(userID: username)
            } else {
                items = try await service.searchPhotos(
                    tags: tags,
                    matchAllTags: matchAllTags,
                    safeSearch: safeSearch
                )
            }
            errorMessage = nil
        } catch {
            errorMessage = error.localizedDescription
            items = []
        }
    }
}
