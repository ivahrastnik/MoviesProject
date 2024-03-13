import ComposableArchitecture

public extension DetailCategories {
    enum Action {
        case viewAppeared
        case detailCategoryTapped(DetailCategoriesButtonCategory)
    }
}
