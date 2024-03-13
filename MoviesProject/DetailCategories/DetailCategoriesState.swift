import ComposableArchitecture

public extension DetailCategories {
    @ObservableState
    struct State: Equatable {
        
        var selectedDetailCategory: DetailCategoriesButton = .aboutMovie
        let movie: Movie
        
        public init(movie: Movie) {
            self.movie = movie
        }
    }
}
