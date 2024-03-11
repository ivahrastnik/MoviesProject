import SwiftUI
import ComposableArchitecture

public extension Home {
    struct HomeView: View {
        let store: Store<State, Action>
//        UBACI U STORE
//        @State var searchText = ""
        
        public init(store: Store<State, Action>) {
            self.store = store
        }

        public var body: some View {
            WithViewStore(store, observe: { $0 }) { viewStore in
                
                    ZStack {
                        switch viewStore.state.moviesLoadingValue{
                        case .idle:
                            Text("idle")
                        case .loading:
                            GeometryReader { proxy in
                                ProgressView()
                                    .foregroundColor(.white)
                                    .background(.darkBackground)
                            }
                        case .loaded(let movies):
                            NavigationView {
                                ScrollView {
                                    VStack() {
                                        //                    TextField("Search", text: $searchText)
                                        Button(action: {
                                            viewStore.send(.searchBarTapped(movies[0]))
                                            print("Button tapped")
                                        }) {                                            HStack(){
                                            Text("Search")
                                            //                                            MovieDetails.MovieDetailsView(store: store.scope(state: \.movieDetails, action: Action.movieDetails))
                                                .padding(EdgeInsets(top: 12, leading: 24, bottom: 12, trailing: 0))
                                                .foregroundColor(.lightGray)
                                                .font(.custom("Poppins", fixedSize: 14))
                                            
                                            Image(.searchIcon)
                                                .frame(maxWidth: .infinity, alignment: .trailing)
                                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 16))
                                                .foregroundColor(.lightGray)
                                        }
                                            //                    .frame(height: 42)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .background(.darkGray)
                                        .cornerRadius(16)
                                        .padding(EdgeInsets(top: 16, leading: 16, bottom: 0, trailing: 16))
                                        }
                                        
                                        TopList.TopListView(store: store.scope(state: \.topList, action: \.topList))
                                        CategoriesList.CategoriesListView(store: store.scope(state: \.categoriesList, action: \.categoriesList))
                                        
                                    }
                                }
                                .frame(maxWidth: .infinity, alignment: .top)
                                .background(.darkBackground)
                                .navigationBarItems(leading:
                                                        Text("What do you want to watch?")
                                    .foregroundColor(.white)
                                    .font(.custom("Poppins", size: 20))
                                )
                            }
                        case .error(let errorDescription):
                            Text(errorDescription)
                        }
                    }
                    .background(.darkBackground)
                    .foregroundStyle(.white)
                    .onAppear {
                        viewStore.send(.viewAppeared)
                    }
                    
            }
        }
    }
}

#if debug
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        Home.HomeView(store: .init(initialState: .init(), reducer: .empty, environment: ()))
    }
}
#endif
