import SwiftUI

struct PhotoDetailContent: View {
    let item: Item
    @State private var strippedDescription = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Group {
                TitleSection(title: item.title)
                DescriptionSection(title: strippedDescription)
                DateSection(title: "Date Taken:", text: formattedDate(item.dateTaken))
                DateSection(title: "Published:", text: formattedDate(item.published))
                AuthorSection(author: item.author)
                if !item.tags.isEmpty { TagsSection(tags: item.tags) }
            }
            .font(.subheadline)
        }
        .padding()
        .onAppear { processDescription() }
        
        Link("View on Flickr", destination: URL(string: item.link)!)
            .font(.headline)
            .foregroundColor(.blue)
            .padding()
    }
    
    private func stripPostedText(from text: String) -> String {
        var cleanedText = text
        if let range = text.range(of: "posted a photo:") {
            cleanedText = String(text[range.upperBound...])
        }
        cleanedText = cleanedText.trimmingCharacters(in: .whitespacesAndNewlines)
        cleanedText = cleanedText.replacingOccurrences(of: "\n", with: " ")
        return cleanedText
    }
    
    private func processDescription() {
        DispatchQueue.globalAsync(qos: .userInitiated) {
            let stripped = stripPostedText(from: item.description.stripHTML())
            DispatchQueue.asyncMain {
                strippedDescription = stripped
            }
        }
    }
    
    private func formattedDate(_ dateString: String) -> String {
        let dateFormatter = ISO8601DateFormatter()
        if let date = dateFormatter.date(from: dateString) {
            let displayFormatter = DateFormatter()
            displayFormatter.dateStyle = .medium
            displayFormatter.timeStyle = .short
            return displayFormatter.string(from: date)
        }
        return dateString
    }
}
