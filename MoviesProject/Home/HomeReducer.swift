import ComposableArchitecture
import Foundation

public struct Home: Reducer {

    public init() {
    }

    public var body: some Reducer<State, Action> {
        Scope(state: \.categoriesList, action: /Action.categoriesList) {
            CategoriesList()
        }
        Reduce<State, Action> { state, action in
            switch action {
            case .viewAppeared:
                if state.moviesLoadingValue == .idle {
                    state.moviesLoadingValue = .loading
                    return .run { send in
                        let (data, _) = try await URLSession.shared
                            .data(from: URL(string: "https://api.npoint.io/57bf829ba4493be4ea53")!)
                        let movies = try? JSONDecoder().decode([Movie].self, from: data)
                        await send(.moviesFetched(movies))
                    }
                }
            case .topList, .categoriesList, .movieDetails, .movieSearch:
                break
            case .moviesFetched(let movies):
                if let movies {
                    state.moviesLoadingValue = .loaded(movies)
                    
                    state.categoriesList.movies = movies
                    state.movieSearch.movies = movies
                    
                    let sortedMovies = movies.sorted { $0.imdbRating > $1.imdbRating }
                    state.topList.sortedMovies = sortedMovies
                    state.categoriesList.sortedMovies = sortedMovies
                    
                } else {
                    state.moviesLoadingValue = .error("Failed fetching movies")
                }
            case .searchBarTapped(let item):
                print(item)
                break
            case .searchTextDidChange(let txt):
                state.searchText = txt
                return .none
            }
            return .none
        }
    }
}
