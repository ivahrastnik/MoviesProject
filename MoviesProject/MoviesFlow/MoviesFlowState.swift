import ComposableArchitecture

public extension MoviesFlow {
    @ObservableState
    struct State: Equatable {
        public init() {
        }
        var home: Home.State = .init()
        var path = StackState<Path.State>()
    }
}
