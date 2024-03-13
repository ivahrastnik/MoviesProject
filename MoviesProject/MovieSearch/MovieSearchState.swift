import ComposableArchitecture

public extension MovieSearch {
    @ObservableState
    struct State: Equatable {
        var movies: [Movie]
        var searchText: String
        
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
