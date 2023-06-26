import SwiftUI

struct Test1: View {
    @State private var scrollOffset: CGFloat = 0

    var body: some View {
        VStack {
            ScrollViewReader { scrollViewProxy in
                ScrollView {
                    VStack(spacing: 20) {
                        ForEach(0..<50) { index in
                            Text("Item \(index)")
                                .frame(width: 200, height: 100)
                                .background(Color.gray)
                        }
                    }
                    .padding()
                    .background(Color.white)
                    .overlay(
                        GeometryReader { geometry in
                            Color.clear
                                .preference(
                                    key: OffsetPreferenceKey.self,
                                    value: geometry.frame(in: .named("scrollView")).origin.y
                                )
                        }
                        .frame(width: 0, height: 0)
                    )
                }
                .coordinateSpace(name: "scrollView")
                .onPreferenceChange(OffsetPreferenceKey.self) { value in
                    scrollOffset = value
                    print("Scroll Offset: \(scrollOffset)")
                }
            }

            Text("Scroll Offset: \(scrollOffset)")
        }
    }
}

struct OffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0

    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

struct Test1_Previews: PreviewProvider {
    static var previews: some View {
        Test1()
    }
}
