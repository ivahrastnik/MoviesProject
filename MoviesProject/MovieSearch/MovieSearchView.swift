import SwiftUI
import ComposableArchitecture

public extension MovieSearch {
    struct MovieSearchView: View {
        let store: Store<State, Action>
        public init(store: Store<State, Action>) {
            self.store = store
        }

        public var body: some View {
            WithViewStore(store, observe: { $0 }) { viewStore in
                
                ZStack {
                        NavigationView {
                            ScrollView {
                                VStack() {
                                    Text("Search")
                                        .foregroundColor(.white)
                                        .font(.custom("Poppins", size: 20))
                                    HStack(){
                                        TextField("", text: viewStore.binding(get: \.searchText, send: Action.searchTextDidChange))
                                        .padding(EdgeInsets(top: 12, leading: 24, bottom: 12, trailing: 0))
                                        .foregroundColor(.lightGray)
                                        .font(.custom("Poppins", fixedSize: 14))
                                        .overlay(
                                            Text("Search")
                                                .foregroundColor(.gray)
                                                .frame(alignment: .leading)
                                                .opacity(viewStore.searchText.isEmpty ? 1 : 0)
                                                .font(.custom("Poppins", fixedSize: 14))
                                        )
                                        
                                        Image(.searchIcon)
                                            .frame(maxWidth: .infinity, alignment: .trailing)
                                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 16))
                                            .foregroundColor(.lightGray)
                                    }
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .background(.darkGray)
                                    .cornerRadius(16)
                                    .padding(EdgeInsets(top: 16, leading: 16, bottom: 0, trailing: 16))
                                    
                                    ForEach(viewStore.filteredMovies, id: \.imdbID) { movie in
                                        
                                        HStack(){
                                            Button(action: {
                                                viewStore.send(.listItemTapped(movie))
                                            }) {
                                                CategoryMovieCell(movie: movie)
                                                    .padding(EdgeInsets(top: 28, leading: 24, bottom: 24, trailing: 0))
                                            }
                                            
                                            VStack(alignment: .leading, spacing: 4) {
                                                
                                                Text(movie.title)
                                                    .frame(maxWidth: .infinity, alignment: .topLeading)
                                                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 16))
                                                    .font(.custom("Poppins", fixedSize: 16))
                                                    .foregroundColor(.white)
                                                
                                                ForEach([(Image(.star), movie.imdbRating),
                                                         (Image(.ticket), movie.genre),
                                                         (Image(.calendar), movie.year),
                                                         (Image(.clock), movie.runtime)], id: \.1) { pair in
                                                    HStack() {
                                                        pair.0
                                                            .resizable()
                                                            .frame(width: 16, height: 16)
                                                        Text(pair.1)
                                                    }.font(.custom("Poppins", fixedSize: 12))
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                            .frame(maxWidth: .infinity, alignment: .top)
                            .background(.darkBackground)
                        }
                }
            }
            .foregroundColor(.white)
        }
    }
}
