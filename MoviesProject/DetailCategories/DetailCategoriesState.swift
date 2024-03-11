import ComposableArchitecture

public extension DetailCategories {
    @ObservableState
    struct State: Equatable {
        var selectedDetailCategory = "About Movie"
        let detailCategories = ["About Movie", "Cast"]
        let movie: Movie
        
        public init(movie: Movie) {
            self.movie = movie
        }
    }
}
