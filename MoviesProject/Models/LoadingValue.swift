import Foundation

enum LoadingValue<Item: Equatable>: Equatable {
    case idle
    case loading
    case loaded(Item)
    case error(String)
}
