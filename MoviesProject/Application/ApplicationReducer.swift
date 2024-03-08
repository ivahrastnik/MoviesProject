import ComposableArchitecture

public struct Application: Reducer {

    public init() { }

    public var body: some Reducer<State, Action> {
        Scope(state: \.moviesFlow, action: /Action.moviesFlow) {
            MoviesFlow()
        }
        Reduce<State, Action> { state, action in
            switch action {
            case .viewAppeared, .moviesFlow:
                break
            }
            return .none
        }
    }
}
