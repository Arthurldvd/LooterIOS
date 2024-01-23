    import SwiftUI

struct LootDetailView: View {
    @State var item: LootItem
    @State private var rotate = false
    @State private var shadowed = false
    @State private var flipped = false
    @State private var shouldShowList = false
    
    var body: some View {
        Section {
            DetailRowImage(item: item)
        }
        List {
            ListInfoView(item: item)
        }
        .transition(.opacity)
        .transition(.slide)
        .opacity(shouldShowList ? 1.0 : 0.0)
        .onAppear() {
            withAnimation(.easeInOut(duration: 0.9)) {
                shouldShowList = true
            }
        }
    }
}
