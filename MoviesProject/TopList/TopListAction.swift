import ComposableArchitecture

public extension TopList {
    enum Action: BindableAction  {
        case viewAppeared
        case binding(BindingAction<State>)
        case listItemTapped(Movie)
//        case topList(TopList.Action)
//        case path(StackAction<MovieDetails.State, MovieDetails.Action>)
    }
}
