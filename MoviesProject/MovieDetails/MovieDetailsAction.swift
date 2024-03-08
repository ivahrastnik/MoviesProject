import ComposableArchitecture

public extension MovieDetails {
    enum Action: BindableAction {
        case viewAppeared
        case binding(BindingAction<State>)
        case detailCategoryTapped(String)

    }
}
