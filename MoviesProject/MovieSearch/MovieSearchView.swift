import SwiftUI
import ComposableArchitecture

public extension MovieSearch {
    struct MovieSearchView: View {
        let store: Store<State, Action>
//        UBACI U STORE
//        @State var searchText = ""
        
        public init(store: Store<State, Action>) {
            self.store = store
        }

        public var body: some View {
            WithViewStore(store, observe: { $0 }) { viewStore in
                
                ZStack {
                        
                        NavigationView {
                            ScrollView {
                                VStack() {
                                    //                    TextField("Search", text: $searchText)
                                    HStack(){
//                                        TextField("Search", text: store.searchText)
                                        Button("Search") {
                                        }
                                        .padding(EdgeInsets(top: 12, leading: 24, bottom: 12, trailing: 0))
                                        .foregroundColor(.lightGray)
                                        .font(.custom("Poppins", fixedSize: 14))
                                        
                                        Image(.searchIcon)
                                            .frame(maxWidth: .infinity, alignment: .trailing)
                                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 16))
                                            .foregroundColor(.lightGray)
                                    }
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .background(.darkGray)
                                    .cornerRadius(16)
                                    .padding(EdgeInsets(top: 16, leading: 16, bottom: 0, trailing: 16))
                                    
                                    
//                                    ForEach(viewStore.movies, id: \.imdbID) { movie in
                                        
                                        HStack(){
                                            Button(action: {
                                                print("HEREEE")
                                                print(viewStore.movie.title)
                                                //                                            viewStore.send(.listItemTapped(movie))
                                            }) {
                                                CategoryMovieCell(movie: viewStore.movie)
                                                    .padding(EdgeInsets(top: 28, leading: 24, bottom: 24, trailing: 0))
                                            }
                                            VStack(alignment: .leading, spacing: 4) {
                                                
                                                Text(viewStore.movie.title)
                                                    .frame(maxWidth: .infinity, alignment: .topLeading)
                                                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 16))
                                                    .font(.custom("Poppins", fixedSize: 16))
                                                    .foregroundColor(.white)
                                                
                                                ForEach([(Image(.star), viewStore.movie.imdbRating),
                                                         (Image(.ticket), viewStore.movie.genre),
                                                         (Image(.calendar), viewStore.movie.year),
                                                         (Image(.clock), viewStore.movie.runtime)], id: \.1) { pair in
                                                    HStack() {
                                                        pair.0
                                                            .resizable()
                                                            .frame(width: 16, height: 16)
                                                        Text(pair.1)
                                                    }.font(.custom("Poppins", fixedSize: 12))
                                                }
                                            }
                                        }
//                                    }
                                    
                                }
                            }
                            .frame(maxWidth: .infinity, alignment: .top)
                            .background(.darkBackground)
                            .navigationBarItems(leading:
                                                    Text("Search")
                                .foregroundColor(.white)
                                .font(.custom("Poppins", size: 20))
                            )
                        }
                        
                    }
                }
                .foregroundStyle(.white)
//
            }
        }
    }
//}

#if debug
struct MovieSearchView_Previews: PreviewProvider {
    static var previews: some View {
        MovieSearch.MovieSearchView(store: .init(initialState: .init(), reducer: .empty, environment: ()))
    }
}
#endif
