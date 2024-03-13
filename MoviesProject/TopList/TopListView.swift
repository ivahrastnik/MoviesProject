import SwiftUI
import ComposableArchitecture

public extension TopList {
    struct TopListView: View {
        let store: Store<State, Action>
        
        public init(store: Store<State, Action>) {
            self.store = store
        }

        public var body: some View {
                WithViewStore(store, observe: { $0 }) { viewStore in
                    let enumeratedMovies = Array(viewStore.sortedMovies.enumerated())
                    
                    ScrollView(.horizontal) {
                        HStack(spacing: 20){
                            ForEach(enumeratedMovies, id: \.element.imdbID) { index, movie in
                                let rating = index + 1 // Rating sorting number (starts from 1)
                                
                                Button(action: {
                                    viewStore.send(.listItemTapped(movie))
                                }) {
                                    TopListMovieCell(movie: movie, rating: rating)
                                }
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                        .frame(height: 250)
                        
                    }.padding(EdgeInsets(top: 0, leading: 16, bottom: 24, trailing: 0))
                }
        }
    }
}
