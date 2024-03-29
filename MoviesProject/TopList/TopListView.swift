import SwiftUI
import ComposableArchitecture

public extension TopList {
    struct TopListView: View {
        let store: Store<State, Action>
        
        public init(store: Store<State, Action>) {
            self.store = store
        }

        public var body: some View {
//            NavigationStackStore(self.store.scope(state: \.path, action: { .path($0) })) {
                WithViewStore(store, observe: { $0 }) { viewStore in
                    //                Text("TopListView")
                    //                    .onAppear {
                    //                        viewStore.send(.viewAppeared)
                    //                    }
                    
                    // Sort movies by imdbRating
                    //                let sortedMovies = viewStore.movies.sorted { $0.imdbRating > $1.imdbRating }
                    let enumeratedMovies = Array(viewStore.sortedMovies.enumerated())
                    
                    ScrollView(.horizontal) {
                        HStack(spacing: 20){
                            //                        ForEach(viewStore.movies, id: \.imdbID) { movie in
                            //                            Button(action: {
                            //                                print(movie.title)
                            //                            })
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

#if debug
struct TopListView_Previews: PreviewProvider {
    static var previews: some View {
        TopList.TopListView(store: .init(initialState: .init(), reducer: .empty, environment: ()))
    }
}
#endif
