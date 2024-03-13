//
//  AsyncImage.swift
//  MoviesProject
//
//  Created by Iva Hrastnik on 12.03.2024..
//

import SwiftUI


struct AsyncImageView: View {
    
    let movie: Movie
    let frameWidth: Double
    public init(movie: Movie, frameWidth: Double) {
        self.movie = movie
        self.frameWidth = frameWidth
    }
    
    var body: some View {
            AsyncImage(url: URL(string: movie.images[0])) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .scaledToFit()
                        .frame(width: frameWidth, height: 210)
                        .clipped()
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 12, trailing: 0))
                        .overlay(alignment: .bottomTrailing) {
                            HStack(){
                                Image(.star)
                                    .padding(EdgeInsets(top: 4, leading: 8, bottom: 4, trailing: 0))
                                    .foregroundColor(.orange)
                                    .cornerRadius(16)
                                Text("\(movie.imdbRating)")
                                    .padding(EdgeInsets(top: 4, leading: 0, bottom: 4, trailing: 8))
                                    .foregroundColor(.orange)
                                    .font(.custom("Montserrat", fixedSize: 12))
                                    .cornerRadius(16)
                            }
                            .frame(height: 24)
                            .background(
                                RoundedRectangle(cornerRadius: 16)
                                    .foregroundColor(Color.darkBackground)
                            )
                            .padding(EdgeInsets(top: 12, leading: 0, bottom: 20, trailing: 12))
                        }
                    
                case .failure:
                    Text("Failed to load image") // Placeholder for failure
                @unknown default:
                    EmptyView()
                }
            }
            .padding(EdgeInsets(top: 16, leading: 0, bottom: 0, trailing: 0))
        }
    }
