import SwiftUI

struct TabBarView: View {
    @State private var selectedTab: TabBarItem = .home
    
    init() { handleSelectedStateColors() }
    
    var body: some View {
        TabView(selection: $selectedTab) {
            ForEach(TabBarItem.allCases, id: \.self) { item in
                viewForTab(item)
                    .tabItem { Label(item.title, systemImage: item.icon) }
            }
        }
        .background(Color.backgroundGray)
        .navigationTitleColor(titleColor: UIColor(Color.contentPrimary))
    }
    
    @ViewBuilder private func viewForTab(_ tab: TabBarItem) -> some View {
        switch tab {
        case .home: PhotoListView()
        case .search: SearchView()
        }
    }
    
    private func handleSelectedStateColors() {
        UITabBar.appearance().unselectedItemTintColor = UIColor(Color.contentSecondary)
        UITabBar.appearance().tintColor = UIColor(Color.contentPrimary)
    }
}

#Preview { TabBarView() }
