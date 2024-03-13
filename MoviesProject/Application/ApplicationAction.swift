import ComposableArchitecture

public extension Application {
    @CasePathable
    enum Action {
        case viewAppeared
        case moviesFlow(MoviesFlow.Action)
    }
}
