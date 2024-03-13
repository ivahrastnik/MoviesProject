import SwiftUI
import ComposableArchitecture

public extension MovieDetails {
    struct MovieDetailsView: View {
        let store: Store<State, Action>
        
        public init(store: Store<State, Action>) {
            self.store = store
        }
        
        public var body: some View {
            WithViewStore(store, observe: { $0 }) { viewStore in
                GeometryReader { proxy in
                    ScrollView(){
                        VStack(alignment: .center){
                            
                            Text("Detail")
                                .foregroundColor(.white)
                                .font(.custom("Poppins", size: 20))
                                .ignoresSafeArea()
                            
                            AsyncImageView(movie: store.movie, frameWidth: proxy.size.width)
                            
                            Text("\(store.movie.title)")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .font(.custom("Poppins", fixedSize: 18))
                                .padding(EdgeInsets(top: 0, leading: 16, bottom: 16, trailing: 0))
                                .foregroundColor(.white)
                            
                            AboutMovieView(year: store.movie.year, runtime: store.movie.runtime, genre: store.movie.genre)
                            
                            DetailCategories.DetailCategoriesView(store: store.scope(state: \.detailCategories, action: \.detailCategories))
                        }
                    }
                }
            }
            .background(.darkBackground)
        }
        
    }
}
