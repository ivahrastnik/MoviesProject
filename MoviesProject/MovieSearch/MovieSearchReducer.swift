import ComposableArchitecture

public struct MovieSearch: Reducer {

    public init() { }
    
    public var body: some Reducer<State, Action> {
        BindingReducer()
        Reduce<State, Action> { state, action in
            switch action {
            case .viewAppeared, .binding:
                break
            }
            return .none
        }
    }
}
