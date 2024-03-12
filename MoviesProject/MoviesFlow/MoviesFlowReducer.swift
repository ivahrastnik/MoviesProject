import ComposableArchitecture

public struct MoviesFlow: Reducer {

    public init() { }

    public var body: some Reducer<State, Action> {
        Scope(state: \.home, action: /Action.home) {
            Home()
        }
        
        Reduce<State, Action> { state, action in
            switch action {
            case .viewAppeared:
                break
            case .home(.topList(.listItemTapped(let movie))):
                state.path.append(.movieDetails(.init(movie: movie)))
            case .home(.categoriesList(.listItemTapped(let movie))):
                state.path.append(.movieDetails(.init(movie: movie)))
            case .home(.searchBarTapped(let movies)):
                state.path.append(.movieSearch(.init(movies: movies)))
            case.path(.element(id: _, action: .movieSearch(.listItemTapped(let movie)))):
                state.path.append(.movieDetails(.init(movie: movie)))
            default: return .none
                
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
