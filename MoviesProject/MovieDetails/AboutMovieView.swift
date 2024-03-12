//
//  AboutMovieView.swift
//  MoviesProject
//
//  Created by Iva Hrastnik on 12.03.2024..
//

import SwiftUI

struct AboutMovieView: View {
    let movie: Movie
    public init(movie: Movie) {
        self.movie = movie
    }
    
    var body: some View {
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
    }
}

//#Preview {
//    AboutMovieView()
//}
