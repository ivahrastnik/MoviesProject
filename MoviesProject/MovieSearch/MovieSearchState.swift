import ComposableArchitecture

public extension MovieSearch {
    @ObservableState
    struct State: Equatable {
//        let detailCategories = ["About Movie", "Cast"]
//        let searchText: String
        let movies: [Movie]
        var searchText: String
//
//        public init(movie: Movie) {
//            self.movie = movie
//            self.searchText = ""
//        }
        
        var filteredMovies: [Movie] {
            guard !searchText.isEmpty else { return movies }
            return movies.filter { $0.title.localizedCaseInsensitiveContains(searchText) }
        }
        
        public init(movies: [Movie]) {
            self.movies = movies
            self.searchText = ""
        }
    }
}
