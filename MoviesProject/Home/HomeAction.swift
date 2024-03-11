import ComposableArchitecture

public extension Home {
    @CasePathable
    enum Action  {
        case viewAppeared
        case topList(TopList.Action)
        case categoriesList(CategoriesList.Action)
        case moviesFetched([Movie]?)
        case movieDetails(MovieDetails.Action)
        case movieSearch(MovieSearch.Action)
        case searchBarTapped(Movie)
//        case path(StackAction<MovieDetails.State, MovieDetails.Action>)
    }
}
