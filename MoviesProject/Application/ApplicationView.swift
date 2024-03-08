import SwiftUI
import ComposableArchitecture

public extension Application {
    struct ApplicationView: View {
        let store: Store<State, Action>
        
        public init(store: Store<State, Action>) {
            self.store = store
        }

        public var body: some View {
            MoviesFlow.MoviesFlowView(store: store.scope(state: \.moviesFlow, action: Action.moviesFlow))
                .background(.darkBackground)
        }
    }
}

#if debug
struct ApplicationView_Previews: PreviewProvider {
    static var previews: some View {
        Application.ApplicationView(store: .init(initialState: .init(), reducer: .empty, environment: ()))
    }
}
#endif
