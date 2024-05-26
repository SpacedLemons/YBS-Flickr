import SwiftUI

struct FrameSquareModifier: ViewModifier {
    private let size: Double

    init(size: Double) { self.size = size }

    func body(content: Content) -> some View {
        content
            .frame(width: size, height: size)
    }
}

extension View {
    /// - `size` refers to the sides of the square.
    func frameSquare(size: Double) -> some View {
        modifier(FrameSquareModifier(size: size))
    }
}
