import ComposableArchitecture

public extension CategoriesList {
    @ObservableState
    struct State: Equatable {
        public init() {}
        var selectedCategory = "Now playing"
        let categories = ["Now playing", "Upcoming", "Top rated", "Popular", "Upcoming2"]
//        let images = ["movie-img-placeholder", "movie-img-placeholder-1", "movie-img-placeholder-2", "movie-img-placeholder-3", "movie-img-placeholder-4", "movie-img-placeholder-5"]
        var movies: [Movie] = []
        var sortedMovies: [Movie] = []
        var moviesUsed: [Movie] = []

    }
}
