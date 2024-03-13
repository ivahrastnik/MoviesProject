import ComposableArchitecture


public extension Home {
    struct State: Equatable {
        public init() {}
        var topList: TopList.State = .init()
        var categoriesList: CategoriesList.State = .init()
        var movieSearch: MovieSearch.State = .init(movies: [])
        var moviesLoadingValue: LoadingValue<[Movie]> = .idle
        var searchText = ""
    }
}

