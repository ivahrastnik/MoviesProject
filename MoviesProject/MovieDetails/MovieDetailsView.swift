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
                        VStack(alignment: .center , spacing: 0){
                            let movie = store.movie
                            AsyncImage(url: URL(string: movie.images[0])) { phase in
                                switch phase {
                                case .empty:
                                    ProgressView()
                                case .success(let image):
                                    image
                                        .scaledToFit()
                                        .frame(width: proxy.size.width, height: 210)
                                        .clipped()
                                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 12, trailing: 0))
                                        .overlay(alignment: .bottomTrailing) {
                                            HStack(){
                                                Image(.star)
                                                    .padding(EdgeInsets(top: 4, leading: 8, bottom: 4, trailing: 0))
                                                    .foregroundColor(.orange)
                                                    .cornerRadius(16)
                                                Text("\(movie.imdbRating)")
                                                    .padding(EdgeInsets(top: 4, leading: 0, bottom: 4, trailing: 8))
                                                    .foregroundColor(.orange)
                                                    .font(.custom("Montserrat", fixedSize: 12))
                                                    .cornerRadius(16)
                                            }
                                            .frame(height: 24)
                                            .background(
                                                RoundedRectangle(cornerRadius: 16)
                                                    .foregroundColor(Color.darkBackground)
                                            )
                                            .padding(EdgeInsets(top: 12, leading: 0, bottom: 20, trailing: 12))
                                        }
                                    
                                case .failure:
                                    Text("Failed to load image") // Placeholder for failure
                                @unknown default:
                                    EmptyView()
                                }
                            }
                            .padding(EdgeInsets(top: 16, leading: 0, bottom: 0, trailing: 0))
                            
                            Text("\(movie.title)")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .font(.custom("Poppins", fixedSize: 18))
                                .padding(EdgeInsets(top: 0, leading: 16, bottom: 16, trailing: 0))
                                .foregroundColor(.white)
                            
                            HStack(){
                                Image(.calendar)
                                Text ("\(movie.year)")
                                Text ("|")
                                Image(.clock)
                                Text ("\(movie.runtime)")
                                Text (" | ")
                                Image(.ticket)
                                Text ("\(movie.genre)")
                            }
                            .font(.custom("Montserrat", fixedSize: 12))
                            .padding(EdgeInsets(top: 16, leading: 0, bottom: 24, trailing: 0))
                            .foregroundColor(.lightGray)
                            
                            DetailCategories.DetailCategoriesView(store: store.scope(state: \.detailCategories, action: \.detailCategories))
                        }
                    }
                }
            }
            .navigationTitle(Text("Detail"))
            .foregroundColor(.white)
            .font(.custom("Poppins", size: 20))
            .background(.darkBackground)
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
