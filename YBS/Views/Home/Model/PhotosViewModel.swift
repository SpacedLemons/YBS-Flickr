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
    
    private let service = FlickrService()

    init() { Task { await fetchPhotos() } }
    
    func fetchPhotos() async {
        await service.fetchPhotos()
        items = service.items
    }

    func fetchUserPhotos(userID: String) async { userPhotos = await service.fetchUserPhotos(userID: userID) }

    func searchPhotosByTag(tag: String) async { items = await service.searchPhotosByTag(tag: tag) }

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
