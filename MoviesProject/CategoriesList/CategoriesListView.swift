import SwiftUI
import ComposableArchitecture

public extension CategoriesList {
    struct CategoriesListView: View {
        let store: Store<State, Action>
        let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]

        
        public init(store: Store<State, Action>) {
            self.store = store
        }

        public var body: some View {
            WithViewStore(store, observe: { $0 }) { viewStore in
                ScrollView(.horizontal) {
                    HStack(spacing: 20){
                        ForEach(viewStore.categories, id: \.self) { category in
                            Button(action: {
//                                print("Button tapped: \(category)")
                                viewStore.send(.categoryTapped(category))
                            }) {
                                Text(category)
                                    .font(.custom("Poppins", size: 14))
                                    .frame(height: 33)
//                                    .padding(.bottom, 4)
                                    .foregroundColor(.white)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 2)
                                            .frame(height: 4)
                                            .foregroundColor(viewStore.selectedCategory == category ? Color.darkGray : Color.clear)
                                            .padding(.bottom, -4)
                                        , alignment: .bottom
                                    )
                            }
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                    .frame(height: 41)
                    .padding(EdgeInsets(top: 0, leading: 16, bottom: 20, trailing: 0))
                    
                    
                }
                
                LazyVGrid(columns: columns) {
                    ForEach((viewStore.selectedCategory == "Top rated" ? viewStore.sortedMovies : viewStore.movies), id: \.imdbID) { movie in
                        
                        Button(action: {
                            viewStore.send(.listItemTapped(movie))
                        }) {
                            CategoryMovieCell(movie: movie)
                        }
                        
                    }
                }.listRowSpacing(20)
            }
        }
    }
}

#if debug
struct CategoriesListView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesList.CategoriesListView(store: .init(initialState: .init(), reducer: .empty, environment: ()))
    }
}
#endif
