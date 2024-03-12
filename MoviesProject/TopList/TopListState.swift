import ComposableArchitecture

public extension TopList {
    struct State: Equatable {
        public init() {}
        var sortedMovies: [Movie] = []
    }
}
