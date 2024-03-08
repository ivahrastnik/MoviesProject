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
//
//struct App {
//    struct State {
//        var moviesFlow: MoviesFlow.State
//    }
//}
//
//struct MoviesFlow {
//    struct State {
//        
//        var home: Home.State
//        
//        var movieDetails: MovieDetails.State?
//    }
//}
//
//struct Home {
//    enum State {
//        case loading
//        case failed
//        case loaded(LoadedState)
//        case search(SearchState)
//        
//    }
//    
//    struct SearchState {
//        var searchString: String
//        var movies: [Movie]
//    }
//    
//    struct LoadedState {
//        struct TopList.State
//        struct CategoriesList.State
//    }
//}
//
//struct MovieDetails {
//    struct State {
//        var movie: Movie
//    }
//}
//
//struct TopList {
//    struct State {
//        var movies: [Movie]
//    }
//}
//
//struct CategoriesList {
//    struct State {
//        var category: [Category]
//    }
//}
//
//
