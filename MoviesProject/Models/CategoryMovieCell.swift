//
//  CategoryMovieCell.swift
//  MoviesProject
//
//  Created by Iva Hrastnik on 07.03.2024..
//

import SwiftUI

struct CategoryMovieCell: View {
    let movie: Movie
    var body: some View {
        
        AsyncImage(url: URL(string: movie.images[0])) { phase in
            switch phase {
            case .empty:
                ProgressView() 
            case .success(let image):
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 145)
                    .clipped()
                    .cornerRadius(16)
            case .failure:
                Text("Failed to load image")
            @unknown default:
                EmptyView()
            }
        }
        
    }
}

//#Preview {
//    CategoryMovieCell()
//}
