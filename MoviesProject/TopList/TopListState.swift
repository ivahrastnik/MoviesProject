import ComposableArchitecture

public extension TopList {
    struct State: Equatable {
        
        public init() {}
        var movies: [Movie] = []
        var sortedMovies: [Movie] = []
//        var path = StackState<MovieDetails.State>()
    }
}
