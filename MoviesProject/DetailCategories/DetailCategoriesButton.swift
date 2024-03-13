//
//  DetailCategoriesButton.swift
//  MoviesProject
//
//  Created by Iva Hrastnik on 12.03.2024..
//

import Foundation
public enum DetailCategoriesButton: CaseIterable, Equatable {
    case aboutMovie
    case cast
    
    var stringValue: String {
        switch self {
        case .aboutMovie:
            return "About Movie"
        case .cast:
            return "Cast"
        }
    }
}
