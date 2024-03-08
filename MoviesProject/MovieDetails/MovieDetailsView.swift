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
                
                VStack(spacing: 0){
                    let movie = store.movie
                    AsyncImage(url: URL(string: movie.images[0])) { phase in
                        switch phase {
                        case .empty:
                            ProgressView() // Placeholder while loading
                        case .success(let image):
                            image.frame(maxWidth: .infinity, alignment: .center)
                                .scaledToFill()
                                .frame(width: 390, height: 210)
                                .clipped()
                                .padding(EdgeInsets(top: 64, leading: 0, bottom: 12, trailing: 0))
                                .overlay(alignment: .bottomTrailing) {
                                    HStack(){
                                        Image(.star)
                                            .frame(maxWidth: .infinity, alignment: .trailing)
                                            .padding(EdgeInsets(top: 4, leading: 8, bottom: 4, trailing: 0))
                                            .foregroundColor(.orange)
                                        Text("\(movie.imdbRating)")
                                            .padding(EdgeInsets(top: 4, leading: 0, bottom: 4, trailing: 8))
                                            .foregroundColor(.orange)
                                            .font(.custom("Montserrat", fixedSize: 12))
                                    }
                                    .frame(width: 60, height: 24)
                                    .cornerRadius(16)
                                    .background(.darkBackground)
                                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 24, trailing: 16))
                                }
                            
                        case .failure:
                            Text("Failed to load image") // Placeholder for failure
                        @unknown default:
                            EmptyView()
                        }
                    }
                    
                    
                    
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
                    
                    ScrollView(.horizontal) {
                        HStack(spacing: 20){
                            ForEach(viewStore.detailCategories, id: \.self) { category in
                                Button(action: {
                                    print("Button tapped: \(category)")
                                    viewStore.send(.detailCategoryTapped(category))
                                }) {
                                    Text(category)
                                        .font(.custom("Poppins", size: 14))
                                        .frame(height: 33)
                                        .padding(.bottom, 4)
                                        .foregroundColor(.white)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 2)
                                                .frame(height: 4)
                                                .foregroundColor(viewStore.selectedDetailCategory == category ? Color.darkGray : Color.clear)
                                                .padding(.bottom, -4)
                                            
                                            , alignment: .bottom
                                        )
                                }
                                
                                
                                
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                        .frame(height: 41)
                        .padding(EdgeInsets(top: 0, leading: 16, bottom: 24, trailing: 0))
                    }
                
                    if viewStore.selectedDetailCategory == "About Movie" {
                        Text("\(movie.plot)")
                            .foregroundColor(.white)
                            .font(.custom("Poppins", size: 12))
                            .padding(EdgeInsets(top: 0, leading: 16, bottom: 16, trailing: 16))
                    } else {
                        Text("\(movie.actors)")
                            .foregroundColor(.white)
                            .font(.custom("Poppins", size: 12))
                            .padding(EdgeInsets(top: 0, leading: 16, bottom: 16, trailing: 16))
                    }
                    
                }.background(.darkBackground)
                
                
            }.navigationTitle("Detail")
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
