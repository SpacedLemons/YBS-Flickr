import SwiftUI

extension Array where Element == GridItem {
    static var columns: [GridItem] {
        [
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible())
        ]
    }
}
