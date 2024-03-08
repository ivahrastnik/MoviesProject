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
                if state.dataFetched == false {
                    state.moviesLoadingValue = .loading
                    return .run { send in
                        let (data, _) = try await URLSession.shared
                            .data(from: URL(string: "https://api.npoint.io/57bf829ba4493be4ea53")!)
                        let movies = try? JSONDecoder().decode([Movie].self, from: data)
                        await send(.moviesFetched(movies))
                    }
                }
            case .topList, .categoriesList:
                break
            case .moviesFetched(let movies):
                if let movies {
                    state.moviesLoadingValue = .loaded(movies)
                    state.topList.movies = movies
                    state.categoriesList.movies = movies
                    
                    let sortedMovies = movies.sorted { $0.imdbRating > $1.imdbRating }
                    state.topList.sortedMovies = sortedMovies
                    state.categoriesList.sortedMovies = sortedMovies
                    state.dataFetched = true
                    
                    
                } else {
                    state.moviesLoadingValue = .error("Failed fetching movies")
                }
            case .movieDetails:
                break
//            case .path(_):
//                    .none
            case .searchBarTapped(let item):
                print(item)
                break
            case .movieSearch:
                break
            }
            return .none
        }
        
//        .forEach(\.path, action: \.path) {
//              Home()
//            }
    }
}
