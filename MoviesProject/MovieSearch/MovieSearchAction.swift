import ComposableArchitecture

public extension MovieSearch {
    enum Action: BindableAction {
        case viewAppeared
        case binding(BindingAction<State>)
    }
}
