import SwiftUI

enum TabBarItem: String, CaseIterable {
    case home, search

    var title: String { rawValue.capitalized }

    var icon: String {
        switch self {
        case .home: "house.fill"
        case .search: "magnifyingglass"
        }
    }
}
