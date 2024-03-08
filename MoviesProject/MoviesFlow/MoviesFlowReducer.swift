import ComposableArchitecture

//public struct Test: Reducer {
//    public func reduce(into state: inout State, action: Action) -> Effect<Action> {
//        switch action {
//        case .viewAppeared:
//            break
//        case .home:
//            break
//        }
//        return .none
//    }
//}

public struct MoviesFlow: Reducer {

    public init() { }

    public var body: some Reducer<State, Action> {
        Scope(state: \.home, action: /Action.home) {
            Home()
        }
//        Scope(state: \.movieDetails, action: /Action.movieDetails) {
//            MovieDetails()
//        }
        Reduce<State, Action> { state, action in
            switch action {
            case .viewAppeared:
                break
            case .home(.topList(.listItemTapped(let movie))):
                state.path.append(.movieDetails(.init(movie: movie)))
            case .home(.categoriesList(.listItemTapped(let movie))):
                state.path.append(.movieDetails(.init(movie: movie)))
            case .home(.searchBarTapped(let movie)):
                state.path.append(.movieSearch(.init(movie: movie)))
                
            case .home:
                break
            case .path:
                break
            }
            return .none
        }
        .forEach(\.path, action: \.path)
    }
}

extension MoviesFlow {
    @Reducer(state: .equatable)
    public enum Path {
        case movieDetails(MovieDetails)
        case movieSearch(MovieSearch)
    }
}
