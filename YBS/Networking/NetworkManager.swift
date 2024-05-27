import Foundation

final class NetworkManager {
    func fetchData(from urlString: String) async throws -> Data {
        guard let url = URL(string: urlString) else { throw URLError(.badURL) }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        return data
    }
    
    func fetch<T: Decodable>(from url: URL) async -> T? {
        do {
            let data = try await fetchData(from: url.absoluteString)
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            print("Error fetching data: \(error)")
            return nil
        }
    }
}
