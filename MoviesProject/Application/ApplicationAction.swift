import ComposableArchitecture

public extension Application {
    enum Action {
        case viewAppeared
        case moviesFlow(MoviesFlow.Action)
    }
}
