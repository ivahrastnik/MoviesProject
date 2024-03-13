import ComposableArchitecture

public extension CategoriesList {
    enum Action: BindableAction {
        case viewAppeared
        case binding(BindingAction<State>)
        case categoryTapped(MovieCategory)
        case listItemTapped(Movie)
    }
}
