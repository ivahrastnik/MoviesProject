import Foundation

public struct Movie: Codable, Equatable {
    let plot: String
    let type: String
    let year: String
    let genre: String
    let rated: String
    let title: String
    let actors: String
    let awards: String
    let images: [String]
    let poster: String
    let writer: String
    let imdbID: String
    let country: String
    let runtime: String
    let director: String
    let language: String
    let released: String
    let response: String
    let metascore: String
    let imdbVotes: String
    let imdbRating: String
    
    enum CodingKeys: String, CodingKey {
        case plot = "Plot"
        case type = "Type"
        case year = "Year"
        case genre = "Genre"
        case rated = "Rated"
        case title = "Title"
        case actors = "Actors"
        case awards = "Awards"
        case images = "Images"
        case poster = "Poster"
        case writer = "Writer"
        case imdbID
        case country = "Country"
        case runtime = "Runtime"
        case director = "Director"
        case language = "Language"
        case released = "Released"
        case response = "Response"
        case metascore = "Metascore"
        case imdbVotes
        case imdbRating
    }
}


