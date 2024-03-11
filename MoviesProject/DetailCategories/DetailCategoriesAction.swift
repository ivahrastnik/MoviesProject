import ComposableArchitecture

public extension DetailCategories {
    indirect enum Action {
        case viewAppeared
        case detailCategoryTapped(String)
    }
}
