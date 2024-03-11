import ComposableArchitecture

public extension CategoriesList {
    @ObservableState
    struct State: Equatable {
        public init() {}
        var selectedCategory = "Now playing"
        let categories = ["Now playing", "Upcoming", "Top rated", "Popular", "Upcoming2"]
        var movies: [Movie] = []
        var sortedMovies: [Movie] = []
        var moviesUsed: [Movie] = []

    }
}
