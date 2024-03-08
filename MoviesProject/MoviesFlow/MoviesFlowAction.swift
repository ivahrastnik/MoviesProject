import ComposableArchitecture

public extension MoviesFlow {
    @CasePathable
    enum Action  {
        case viewAppeared
        case home(Home.Action)
        case path(StackAction<Path.State, Path.Action>)
    }
}
