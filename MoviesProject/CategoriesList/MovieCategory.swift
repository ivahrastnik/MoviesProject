//
//  MovieCategories.swift
//  MoviesProject
//
//  Created by Iva Hrastnik on 12.03.2024..
//

import Foundation

public enum MovieCategory: CaseIterable, Equatable {
    case nowPlaying
    case upcoming
    case topRated
    case popular
    case another
    
    var stringValue: String {
        switch self {
        case .nowPlaying:
            return "Now playing"
        case .upcoming:
            return "Upcoming"
        case .topRated:
            return "Top rated"
        case .popular:
            return "Popular"
        case .another:
            return "Another"
        }
    }
}
