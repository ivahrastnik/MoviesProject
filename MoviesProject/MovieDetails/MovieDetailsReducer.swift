import ComposableArchitecture

public struct MovieDetails: Reducer {

    public init() { }
    
    public var body: some Reducer<State, Action> {
        BindingReducer()
        Reduce<State, Action> { state, action in
            switch action {
            case .viewAppeared, .binding:
                break
            case let .detailCategoryTapped(category):
                state.selectedDetailCategory = category
                return .none
            }
            return .none
        }
    }
}
