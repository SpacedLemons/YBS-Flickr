import Foundation

struct Endpoint {
    static let baseURL = URL(string: "https://www.flickr.com/services/feeds/photos_public.gne")!

    static func with(_ parameters: [String: String]) -> URL {
        var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)!
        urlComponents.queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value) }
        return urlComponents.url!
    }
}
