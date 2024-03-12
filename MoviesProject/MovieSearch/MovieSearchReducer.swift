import ComposableArchitecture

public struct MovieSearch: Reducer {

    public init() { }
    
    public var body: some Reducer<State, Action> {
        Reduce<State, Action> { state, action in
            switch action {
            case .viewAppeared:
                break
            case .searchTextDidChange(let txt):
                state.searchText = txt
                return .none
            case .listItemTapped(let item):
                break
            }
            return .none
        }
    }
}
