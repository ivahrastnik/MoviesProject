import ComposableArchitecture

public struct CategoriesList: Reducer {

    public init() { }

    public var body: some Reducer<State, Action> {
        BindingReducer()
        Reduce<State, Action> { state, action in
            switch action {
            case .viewAppeared, .binding:
                break
            case let .categoryTapped(category):
                state.selectedCategory = category
            case .listItemTapped(_):
                break
            }
            return .none
        }
    }
}
