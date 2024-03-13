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
                        
                        ForEach(MovieCategory.allCases, id: \.self) { category in
                            Button(action: {
                                viewStore.send(.categoryTapped(category))
                            }) {
                                Text(category.stringValue)
                                    .font(.custom("Poppins", size: 14))
                                    .frame(height: 33)
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
                    .frame(height: 40)
                    .padding(EdgeInsets(top: 0, leading: 16, bottom: 20, trailing: 0))
                }
                
                LazyVGrid(columns: columns) {
                    
                    ForEach((viewStore.selectedCategory == .topRated ? viewStore.sortedMovies : viewStore.movies), id: \.imdbID) { movie in
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
