import ComposableArchitecture

public struct MovieDetails: Reducer {

    public init() { }
    
    public var body: some Reducer<State, Action> {
        Scope(state: \.detailCategories, action: /Action.detailCategories) {
            DetailCategories()
        }
        Reduce<State, Action> { state, action in
            switch action {
            case .viewAppeared:
                break
            case .detailCategories:
                break
            }
            
            return .none
        }
    }
}
