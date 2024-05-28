import XCTest
@testable import YBS

@MainActor
final class PhotosViewModelTests: XCTestCase {
    func testItemsGetFetchedAndSetAppropriately() async throws {
        // Given
        let mockService = MockFlickerService(
            itemsToReturn: [
                Item(
                    title: "Dummy Photo Title",
                    link: "https://www.flickr.com",
                    media: Media(url: "https://picsum.photos/id/237/200/300"),
                    dateTaken: "2023-05-23",
                    description: "This is a great dummy description",
                    published: "2023-05-23",
                    author: "nobody@flickr.com (\"jsquare0299\")",
                    authorID: "Author here!",
                    tags: "tag1 tag2 tag3tag4tag5"
                )
            ]
        )
        
        let photosViewModel = PhotosViewModel(service: mockService)
        
        // When
        XCTAssertEqual(photosViewModel.items.count, 0)
        await photosViewModel.fetchPhotos()
        
        // Then
        XCTAssertEqual(photosViewModel.items.count, 1)
        XCTAssertEqual(photosViewModel.items.first?.title, "Dummy Photo Title")
    }
    
    func testFetchUserPhotos() async throws {
        // Given
        let mockService = MockFlickerService(
            itemsToReturn: [],
            userPhotosToReturn: [
                Item(
                    title: "User Photo",
                    link: "https://www.flickr.com",
                    media: Media(url: "https://picsum.photos/id/238/200/300"),
                    dateTaken: "2023-05-24",
                    description: "This is a user photo description",
                    published: "2023-05-24",
                    author: "nobody@flickr.com (\"jsquare0299\")",
                    authorID: "UserID123",
                    tags: "usertag1 usertag2"
                )
            ]
        )
        
        let photosViewModel = PhotosViewModel(service: mockService)
        
        // When
        await photosViewModel.fetchUserPhotos(userID: "UserID123")
        
        // Then
        XCTAssertEqual(photosViewModel.userPhotos.count, 1)
        XCTAssertEqual(photosViewModel.userPhotos.first?.title, "User Photo")
    }

    func testSearchPhotosByTag() async throws {
        // Given
        let mockService = MockFlickerService(
            itemsToReturn: [],
            tagSearchResults: [
                Item(
                    title: "Tagged Photo",
                    link: "https://www.flickr.com",
                    media: Media(url: "https://picsum.photos/id/239/200/300"),
                    dateTaken: "2023-05-25",
                    description: "This is a tagged photo description",
                    published: "2023-05-25",
                    author: "nobody@flickr.com (\"jsquare0299\")",
                    authorID: "Author here!",
                    tags: "taggedphoto"
                )
            ]
        )
        
        let photosViewModel = PhotosViewModel(service: mockService)
        
        // When
        await photosViewModel.searchPhotosByTag(tag: "taggedphoto")
        
        // Then
        XCTAssertEqual(photosViewModel.items.count, 1)
        XCTAssertEqual(photosViewModel.items.first?.title, "Tagged Photo")
    }
    
    func testSelectPhoto() {
        // Given
        let item = Item(
            title: "Selected Photo",
            link: "https://www.flickr.com",
            media: Media(url: "https://picsum.photos/id/240/200/300"),
            dateTaken: "2023-05-26",
            description: "This is a selected photo description",
            published: "2023-05-26",
            author: "nobody@flickr.com (\"jsquare0299\")",
            authorID: "Author here!",
            tags: "selectedphoto"
        )
        
        let photosViewModel = PhotosViewModel(service: MockFlickerService(itemsToReturn: []))
        
        // When
        photosViewModel.selectPhoto(item)
        
        // Then
        XCTAssertEqual(photosViewModel.selectedPhoto?.title, "Selected Photo")
        XCTAssertTrue(photosViewModel.isShowingPhotoDetails)
    }
    
    func testSelectUserID() {
        // Given
        let photosViewModel = PhotosViewModel(service: MockFlickerService(itemsToReturn: []))
        
        // When
        photosViewModel.selectUserID("TestUserID")
        
        // Then
        XCTAssertEqual(photosViewModel.selectedUserID, "TestUserID")
        XCTAssertTrue(photosViewModel.isShowingUserPhotos)
    }
    
    func testSelectTags() {
        // Given
        let photosViewModel = PhotosViewModel(service: MockFlickerService(itemsToReturn: []))
        
        // When
        photosViewModel.selectTags("testtag1 testtag2")
        
        // Then
        XCTAssertEqual(photosViewModel.selectedTags?.tags, "testtag1 testtag2")
    }
}
