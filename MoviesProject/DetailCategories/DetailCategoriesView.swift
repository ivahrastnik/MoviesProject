import SwiftUI
import ComposableArchitecture

public extension DetailCategories {
    struct DetailCategoriesView: View {
        let store: Store<State, Action>
        
        public init(store: Store<State, Action>) {
            self.store = store
        }

        public var body: some View {
            WithViewStore(store, observe: { $0 }) { viewStore in
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
                    .frame(height: 41)
                    .padding(EdgeInsets(top: 0, leading: 16, bottom: 24, trailing: 0))
                }
                
                if viewStore.selectedDetailCategory == "About Movie" {
                    Text(viewStore.movie.plot)
                        .foregroundColor(.white)
                        .font(.custom("Poppins", size: 12))
                        .padding(EdgeInsets(top: 0, leading: 16, bottom: 16, trailing: 16))
                } else {
                    VStack(alignment: .leading, spacing: 20) {
                        ForEach(viewStore.movie.actors.components(separatedBy: ", "), id: \.self) { actor in
                            Text(actor)
                                .foregroundColor(.white)
                                .font(.custom("Poppins", size: 12))
                        }
                    }
                }
            }
        }
    }
}

#if debug
struct eView_Previews: PreviewProvider {
    static var previews: some View {
        e.eView(store: .init(initialState: .init(), reducer: .empty, environment: ()))
    }
}
#endif