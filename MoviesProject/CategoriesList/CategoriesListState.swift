import ComposableArchitecture

public extension CategoriesList {
    @ObservableState
    struct State: Equatable {
        
        enum MovieCategories: Equatable {
            case nowPlaying
            case upcoming
            case topRated
            case popular
            case another
            
            var stringValue: String {
                switch self {
                case .nowPlaying:
                    return "Now playing"
                case .upcoming:
                    return "Upcoming"
                case .topRated:
                    return "Top rated"
                case .popular:
                    return "Popular"
                case .another:
                    return "Another"
                }
            }
        }
//        var selectedCategory = MovieCategories.nowPlaying
        var selectedCategory = "Now playing"
        let categories = ["Now playing", "Upcoming", "Top rated", "Popular", "Another"]
        var movies: [Movie] = []
        var sortedMovies: [Movie] = []
        var moviesUsed: [Movie] = []
        
        public init() {}

    }
}
