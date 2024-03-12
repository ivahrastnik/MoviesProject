import SwiftUI
import ComposableArchitecture

public extension MoviesFlow {
    struct MoviesFlowView: View {
        @Bindable var store: StoreOf<MoviesFlow>

        public var body: some View {
            NavigationStack(path: $store.scope(state: \.path, action: \.path)) {
                Home.HomeView(store: store.scope(state: \.home, action: \.home)).background(.darkBackground)
            } destination: { store in
                switch store.case {
                case let .movieDetails(store):
                    MovieDetails.MovieDetailsView(store: store)
                case let .movieSearch(store):
                    MovieSearch.MovieSearchView(store: store)
                }
            }
            .background(.darkBackground).edgesIgnoringSafeArea(.all)
        }
    }
}

#if debug
struct MoviesFlowView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesFlow.MoviesFlowView(store: .init(initialState: .init(), reducer: .empty, environment: ()))
    }
}
#endif
