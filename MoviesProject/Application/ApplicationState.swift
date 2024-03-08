import ComposableArchitecture

public extension Application {
    struct State: Equatable {
        public init() {
        }
        var moviesFlow: MoviesFlow.State = .init()
    }
    
}
