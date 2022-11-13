//
//  MovieCardView.swift
//  MovieDatabase
//
//  Created by Belli's MacBook on 13/11/2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct MovieCardView: View {
    let movie: MovieModel
    
    var body: some View {
        VStack {
            ZStack{
                Color.white
                VStack{
                    AnimatedImage(url: movie.backdropURL)
                        .resizable()
                        .placeholder{
                            ZStack {
                                Color.gray
                                ProgressView()
                            }
                            .cornerRadius(20)
                            .frame(width: 200, height: 250)
                        }
                        .scaledToFill()
                        .frame(width: 200, height: 250)
                        


                    
                }
            }
            .cornerRadius(20)
            .frame(width: 200, height: 250)
            
            VStack(alignment: .leading){
                Text(movie.title)
                    .foregroundColor(.white)
                    .font(.system(size: 17, weight: .semibold))
                
                
                Text(movie.releaseDate)
                    .foregroundColor(.gray)
                    .font(.system(size: 15, weight: .medium))
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

struct MovieCardView_Previews: PreviewProvider {
    static var previews: some View {
        MovieCardView(movie: dev.movie1)
            .previewLayout(.sizeThatFits)
    }
}
