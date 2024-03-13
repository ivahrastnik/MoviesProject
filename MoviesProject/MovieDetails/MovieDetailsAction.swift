import ComposableArchitecture

public extension MovieDetails {
    @CasePathable
    enum Action {
        case viewAppeared
        case detailCategories(DetailCategories.Action)
    }
}
