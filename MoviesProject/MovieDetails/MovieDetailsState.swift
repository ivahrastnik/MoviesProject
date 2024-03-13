import ComposableArchitecture

public extension MovieDetails {
    @ObservableState
    struct State: Equatable {
        
        let movie: Movie
        var detailCategories: DetailCategories.State
        
        public init(movie: Movie) {
            self.movie = movie
            self.detailCategories = .init(plot: movie.plot, actors: movie.actors)
        }
    }
}
