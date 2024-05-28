import Foundation
@testable import YBS

class MockFlickerService: FlickrServiceProtocol {
    
    var itemsToReturn: [YBS.Item]
    var items: [YBS.Item] = []
    var userPhotosToReturn: [YBS.Item]
    var tagSearchResults: [YBS.Item]
    
    init(
        itemsToReturn: [YBS.Item],
        userPhotosToReturn: [YBS.Item] = [],
        tagSearchResults: [YBS.Item] = []
    ) {
        self.itemsToReturn = itemsToReturn
        self.userPhotosToReturn = userPhotosToReturn
        self.tagSearchResults = tagSearchResults
    }
    
    func fetchPhotos() async throws {
        try await Task.sleep(nanoseconds: 250_000_000) // Simulating a network delay
        items = itemsToReturn
    }
    
    func fetchSearchPhotos(title: String) async throws -> [YBS.Item] {
        try await Task.sleep(nanoseconds: 250_000_000)
        return itemsToReturn.filter { $0.title.contains(title) }
    }
    
    func searchPhotos(tags: String, matchAllTags: Bool, safeSearch: Int) async throws -> [YBS.Item] {
        try await Task.sleep(nanoseconds: 250_000_000)
        return itemsToReturn.filter { $0.tags.contains(tags) }
    }
    
    func searchPhotosByTag(tag: String) async throws -> [YBS.Item] {
        try await Task.sleep(nanoseconds: 250_000_000)
        return tagSearchResults.filter { $0.tags.contains(tag) }
    }
    
    func fetchUserPhotos(userID: String) async throws -> [YBS.Item] {
        try await Task.sleep(nanoseconds: 250_000_000)
        return userPhotosToReturn.filter { $0.authorID == userID }
    }
}
