import ComposableArchitecture

public struct DetailCategories: Reducer {

    public init() { }

    public var body: some Reducer<State, Action> {
        Reduce<State, Action> { state, action in
            switch action {
            case .viewAppeared:
                break
            case let .detailCategoryTapped(category):
                state.selectedDetailCategory = category
                return .none
            }
            return .none
        }
    }
}
