import ComposableArchitecture

public struct TopList: Reducer {

    public init() { }

    public var body: some Reducer<State, Action> {
        BindingReducer()
        Reduce<State, Action> { state, action in
            switch action {
            case .viewAppeared, .binding:
                break
            case .listItemTapped(let item):
//                print(item)
                break
                //            case .path(_):
                //                return .none
            }
            return .none
        }
        
//        .forEach(\.path, action: /Action.path) {
//              MovieDetails()
//            }
    }
}
