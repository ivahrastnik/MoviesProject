import ComposableArchitecture

public extension CategoriesList {
    @ObservableState
    struct State: Equatable {
        var selectedCategory: MovieCategory = .nowPlaying
        var movies: [Movie] = []
        var sortedMovies: [Movie] = []
        var moviesUsed: [Movie] = []
        
        public init() {}
    }
}
