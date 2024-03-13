import ComposableArchitecture

public extension MovieSearch {
    enum Action {
        case viewAppeared
        case searchTextDidChange(String)
        case listItemTapped(Movie)
    }
}
