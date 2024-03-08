//
//  TopListMovieCell.swift
//  MoviesProject
//
//  Created by Iva Hrastnik on 06.03.2024..
//

import SwiftUI

struct TopListMovieCell: View {
    let movie: Movie
    let rating: Int
    
    var body: some View {
        
        
        AsyncImage(url: URL(string: movie.images[0])) { phase in
            switch phase {
            case .empty:
                ProgressView() // Placeholder while loading
            case .success(let image):
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 140, height: 210)
                    .clipped()
                    .cornerRadius(16)
                    .padding(EdgeInsets(top: 20, leading: 10, bottom: 0, trailing: 10))
                    .overlay(alignment: .bottomLeading) {
                        Text("\(rating)")
                            .foregroundColor(.blue)
                            .font(.custom("Montserrat", fixedSize: 100))
                        //                            .frame(maxWidth: .infinity, alignment: .bottomLeading)
                            .alignmentGuide(.bottom, computeValue: { dimension in
                                dimension[.bottom] - 30
                            })
                            .alignmentGuide(.leading, computeValue: { dimension in
                                dimension[.leading] + 10
                            })
                    }
            case .failure:
                Text("Failed to load image") // Placeholder for failure
            @unknown default:
                EmptyView()
            }
        }

        
        
//        AsyncImage(url: URL(string: movie.images[0])) { phase in
//            phase.image
//                .clipped()
//                .resizable()
//                .cornerRadius(16)
//                .frame(width: 140, height: 210)
//                .scaledToFill()
//                .padding(EdgeInsets(top: 20, leading: 15, bottom: 0, trailing: 15))
//                .overlay(alignment: .bottomLeading){
//                    Text("\(rating)")
//                        .foregroundColor(.blue)
//                        .font(.custom("Montserrat", fixedSize: 96))
//                        .frame(maxWidth: .infinity, alignment: .bottomLeading)
//                }
//            //                Image(.movieImgPlaceholder)
//            
//        }
        
    }
    
    //#Preview {
    //    TopListMovieCell(movie: <#Movie#>, index: <#Int#>, body: <#some View#>)
    //}
}
