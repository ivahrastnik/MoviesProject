import ComposableArchitecture

public struct TopList: Reducer {

    public init() { }

    public var body: some Reducer<State, Action> {
        BindingReducer()
        Reduce<State, Action> { state, action in
            switch action {
            case .viewAppeared, .binding:
                break
            case .listItemTapped(_):
                break
            }
            return .none
        }
    }
}
