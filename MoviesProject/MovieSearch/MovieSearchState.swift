import ComposableArchitecture

public extension MovieSearch {
    @ObservableState
    struct State: Equatable {
//        let detailCategories = ["About Movie", "Cast"]
        let searchText: String
        let movie: Movie
//
        public init(movie: Movie) {
            self.movie = movie
            self.searchText = ""
        }
    }
}
