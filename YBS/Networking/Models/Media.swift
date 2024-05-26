import Foundation

struct Media: Decodable {
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case url = "m"
    }
}
