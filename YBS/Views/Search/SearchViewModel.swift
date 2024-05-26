import Foundation

final class SearchViewModel: ObservableObject {
    @Published var tags = "Yorkshire"
    @Published var username = ""
    @Published var matchAllTags = false
    @Published var items: [Item] = []
    @Published var safeSearch = 1
    @Published var lastSearchType = ""
    @Published var lastSearchValue = ""
    
    @MainActor private let service = FlickrService()

    @MainActor
    func performSearch() async {
        lastSearchType = username.isEmpty ? "tag" : "user"
        lastSearchValue = username.isEmpty ? tags : username
        if !username.isEmpty {
            items = await service.fetchUserPhotos(userID: username)
        } else {
            items = await service.searchPhotos(
                searchText: "",
                tags: tags,
                matchAllTags: matchAllTags,
                safeSearch: safeSearch
            )
        }
    }
}
