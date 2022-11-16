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
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        VStack(alignment: .leading){
            VStack(alignment: .leading){
                AnimatedImage(url: URL(string: movie.posterURL))
                    .resizable()

                    .placeholder{
                        ShimmerEffect(width: width, height: height)
                    }
                    .frame(width: width, height: height)
            }
            .cornerRadius(10)
            .frame(width: width, height: height)
            
            VStack(alignment: .leading){
                Text(movie.title)
                    .foregroundColor(.white)
                    .font(.system(size: 17, weight: .semibold))
                    .frame(maxWidth: width, alignment: .leading)
                    .multilineTextAlignment(.leading)
                  //  .fixedSize(horizontal: false, vertical: true)

                
                
                Text(movie.releaseDate.asReadbleDate())
                    .foregroundColor(.gray)
                    .font(.system(size: 15, weight: .medium))
                
            }
        }
    }
}

struct MovieCardView_Previews: PreviewProvider {
    static var previews: some View {
        MovieCardView(movie: dev.movie1, width: 200, height: 250)
            .previewLayout(.sizeThatFits)
    }
}
