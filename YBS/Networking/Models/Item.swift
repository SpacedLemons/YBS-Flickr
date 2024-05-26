import Foundation

struct Item: Decodable, Identifiable {
    var id: String { link }
    let title: String
    let link: String
    let media: Media
    let dateTaken: String
    var description: String
    let published: String
    let author: String
    let authorID: String
    let tags: String

    var imageURL: String { return media.url }
    var iconURL: String { return "https://www.flickr.com/buddyicons/\(authorID).jpg" }
    
    enum CodingKeys: String, CodingKey {
        case title
        case link
        case media
        case dateTaken = "date_taken"
        case description
        case published
        case author
        case authorID = "author_id"
        case tags
    }
}
