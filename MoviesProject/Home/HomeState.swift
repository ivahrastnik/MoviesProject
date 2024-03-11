import ComposableArchitecture


public extension Home {
    struct State: Equatable {
        public init() {}
        var dataFetched: Bool = false
        var topList: TopList.State = .init()
        var categoriesList: CategoriesList.State = .init()
        var moviesLoadingValue: LoadingValue<[Movie]> = .idle
        var searchText = ""
    }
}

