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
                            
                            AsyncImageView(movie: store.movie, frameWidth: proxy.size.width)
                            
                            Text("\(store.movie.title)")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .font(.custom("Poppins", fixedSize: 18))
                                .padding(EdgeInsets(top: 0, leading: 16, bottom: 16, trailing: 0))
                                .foregroundColor(.white)
                            
                            AboutMovieView(movie: store.movie)
                            
                            DetailCategories.DetailCategoriesView(store: store.scope(state: \.detailCategories, action: \.detailCategories))
                        }
                    }
                }
            }
            
            .background(.darkBackground)
            .navigationBarItems(leading: HStack {
                Text("                    ")
                Spacer() // Add a Spacer to push "Detail" to the center
                Text("Detail")
                    .foregroundColor(.white)
                    .font(.custom("Poppins", size: 20))
            }
            )
            .foregroundColor(.white)
        }
            
    }
}

#if debug
struct MovieDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetails.MovieDetailsView(store: .init(initialState: .init(), reducer: .empty, environment: ()))
    }
}
#endif
