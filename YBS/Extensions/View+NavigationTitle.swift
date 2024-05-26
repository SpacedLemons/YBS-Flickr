import SwiftUI

extension View {
    func navigationTitleColor(titleColor: UIColor) -> some View {
        onAppear {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = .white
            appearance.titleTextAttributes = [.foregroundColor: titleColor]
            appearance.largeTitleTextAttributes = [.foregroundColor: titleColor]

            UINavigationBar.appearance().standardAppearance = appearance
            UINavigationBar.appearance().compactAppearance = appearance
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
        }
    }
}
