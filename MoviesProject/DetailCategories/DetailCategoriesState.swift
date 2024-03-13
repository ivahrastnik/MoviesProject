import ComposableArchitecture
import SwiftUI

public extension DetailCategories {
    @ObservableState
    struct State: Equatable {
        
        var selectedDetailCategory: DetailCategoriesButtonCategory = .aboutMovie
        let plot: String
        let actorString: String
        
        var actors: [String] {
            actorString.components(separatedBy: ", ")
        }
        
        public init(plot: String, actors: String) {
            self.plot = plot
            self.actorString = actors
        }
    }
}
