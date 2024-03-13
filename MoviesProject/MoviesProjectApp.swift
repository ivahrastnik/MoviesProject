import SwiftUI
import ComposableArchitecture

@main
struct MoviesProjectApp: App {
    
    let store: StoreOf<Application>
    init() {
        store = .init(initialState: .init(), reducer: { Application()._printChanges() })
    }
    
    var body: some Scene {
        WindowGroup {
            Application.ApplicationView(store: store)
        }
    }
}
