//
//  AboutMovieView.swift
//  MoviesProject
//
//  Created by Iva Hrastnik on 12.03.2024..
//

import SwiftUI

struct AboutMovieView: View {
    let year: String
    let runtime: String
    let genre: String
    public init(year: String, runtime: String, genre: String) {
        self.year = year
        self.runtime = runtime
        self.genre = genre
    }
    
    var body: some View {
        HStack(){
            Image(.calendar)
            Text ("\(year)")
            Text ("|")
            Image(.clock)
            Text ("\(runtime)")
            Text (" | ")
            Image(.ticket)
            Text ("\(genre)")
        }
        .font(.custom("Montserrat", fixedSize: 12))
        .padding(EdgeInsets(top: 16, leading: 0, bottom: 24, trailing: 0))
        .foregroundColor(.lightGray)
    }
}
