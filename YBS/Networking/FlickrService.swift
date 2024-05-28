import Foundation

@MainActor
protocol FlickrServiceProtocol {
    var items: [Item] { get }
    
    func fetchPhotos() async throws
    func fetchSearchPhotos(title: String) async throws -> [Item]
    func searchPhotos(tags: String, matchAllTags: Bool, safeSearch: Int) async throws -> [Item]
    func searchPhotosByTag(tag: String) async throws -> [Item]
    func fetchUserPhotos(userID: String) async throws -> [Item]
}

@MainActor
final class FlickrService: FlickrServiceProtocol, ObservableObject {
    @Published private(set) var items: [Item] = []
    private let networkManager = NetworkManager()
    
    func fetchPhotos() async {
        let parameters = [
            "format": "json",
            "nojsoncallback": "1"
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
            "text": title
        ]
        
        let url = Endpoint.with(parameters)
        if let response: PhotosResponse = await networkManager.fetch(from: url) {
            self.items = response.items
            return response.items
        }
        return []
    }
    
    func searchPhotos(tags: String, matchAllTags: Bool, safeSearch: Int) async -> [Item] {
        let tagMode = matchAllTags ? "all" : "any"
        let parameters = [
            "format": "json",
            "nojsoncallback": "1",
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
            "tags": tag
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
            "format": "json",
            "nojsoncallback": "1",
            "id": userID,
        ]
        
        let url = Endpoint.with(parameters)
        if let response: PhotosResponse = await networkManager.fetch(from: url) {
            return response.items
        }
        return []
    }
}
