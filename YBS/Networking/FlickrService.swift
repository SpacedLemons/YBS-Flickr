import Foundation

@MainActor
final class FlickrService: ObservableObject {
    @Published private(set) var items: [Item] = []
    private let networkManager = NetworkManager()
    
    func fetchPhotos() async {
        let parameters = [
            "format": "json",
            "nojsoncallback": "1",
            "safe_search": "1"
        ]
        
        let url = Endpoint.with(parameters)
        if let response: PhotosResponse = await networkManager.fetch(from: url) {
            self.items = response.items
        }
    }
    
    func fetchSearchPhotos(title: String) async -> [Item] {
        let parameters = [
            "format": "json",
            "nojsoncallback": "1",
            "safe_search": "1",
            "text": title
        ]
        
        let url = Endpoint.with(parameters)
        if let response: PhotosResponse = await networkManager.fetch(from: url) {
            self.items = response.items
            return response.items
        }
        return []
    }
    
    func searchPhotos(searchText: String, tags: String, matchAllTags: Bool, safeSearch: Int) async -> [Item] {
        let tagMode = matchAllTags ? "all" : "any"
        let parameters = [
            "format": "json",
            "nojsoncallback": "1",
            "text": searchText,
            "tags": tags,
            "tagmode": tagMode,
            "safe_search": "\(safeSearch)"
        ]
        
        let url = Endpoint.with(parameters)
        if let response: PhotosResponse = await networkManager.fetch(from: url) {
            self.items = response.items
            return response.items
        }
        return []
    }
    
    func searchPhotosByTag(tag: String) async -> [Item] {
        let parameters = [
            "format": "json",
            "nojsoncallback": "1",
            "tags": tag,
            "safe_search": "1"
        ]
        
        let url = Endpoint.with(parameters)
        if let response: PhotosResponse = await networkManager.fetch(from: url) {
            self.items = response.items
            return response.items
        }
        return []
    }
    
    func fetchUserPhotos(userID: String) async -> [Item] {
        let parameters = [
            "id": userID,
            "format": "json",
            "nojsoncallback": "1",
            "safe_search": "1"
        ]
        
        let url = Endpoint.with(parameters)
        if let response: PhotosResponse = await networkManager.fetch(from: url) {
            return response.items
        }
        return []
    }
}
