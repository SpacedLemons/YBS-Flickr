import SwiftUI

@MainActor
final class PhotosViewModel: ObservableObject {
    @Published var items: [Item] = []
    @Published var selectedTags: TagWrapper?
    @Published var selectedUserID: String?
    @Published var isShowingUserPhotos = false
    @Published var isShowingPhotoDetails = false
    @Published var selectedPhoto: Item?
    @Published var userPhotos: [Item] = []
    @Published var errorMessage: String?

    private let service: FlickrServiceProtocol
    private var isSearchingPhotosByTag = false
    
    init(service: FlickrServiceProtocol) {
        self.service = service
        Task { await fetchPhotos() }
    }
    
    func fetchPhotos() async {
        guard !isSearchingPhotosByTag else { return }
        do {
            try await service.fetchPhotos()
            items = service.items
            errorMessage = nil
        } catch {
            errorMessage = error.localizedDescription
            items = []
        }
    }

    func fetchUserPhotos(userID: String) async {
        do {
            userPhotos = try await service.fetchUserPhotos(userID: userID)
            errorMessage = nil
        } catch {
            errorMessage = error.localizedDescription
            userPhotos = []
        }
    }
    
    func searchPhotosByTag(tag: String) async {
        isSearchingPhotosByTag = true
        do {
            items = try await service.searchPhotosByTag(tag: tag)
            errorMessage = nil
            print("Fetched items tag")
        } catch {
            errorMessage = error.localizedDescription
            items = []
        }
        isSearchingPhotosByTag = false
    }

    func selectPhoto(_ photo: Item) {
        selectedPhoto = photo
        isShowingPhotoDetails = true
    }

    func selectUserID(_ userID: String) {
        selectedUserID = userID
        isShowingUserPhotos = true
    }
    
    func selectTags(_ tags: String) { selectedTags = TagWrapper(tags: tags) }
}
    