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
        VStack(alignment: .leading){
            VStack(alignment: .leading){
                AnimatedImage(url: URL(string: movie.posterURL))
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
            .cornerRadius(20)
            .frame(width: 200, height: 250)
            
            VStack(alignment: .leading){
                Text(movie.title)
                    .foregroundColor(.white)
                    .font(.system(size: 17, weight: .semibold))
                    .frame(maxWidth: 200, alignment: .leading)
                    .multilineTextAlignment(.leading)
                  //  .fixedSize(horizontal: false, vertical: true)

                
                
                Text(movie.releaseDate.asReadbleDate())
                    .foregroundColor(.gray)
                    .font(.system(size: 15, weight: .medium))
                
            }
        }
    }
    
    private func dateFormatter(dateString: String)-> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        guard let date = dateFormatter.date(from: dateString) else{return ""}
        dateFormatter.dateFormat = "MMM dd, yyyy"
        return dateFormatter.string(from: date)
    }
}

struct MovieCardView_Previews: PreviewProvider {
    static var previews: some View {
        MovieCardView(movie: dev.movie1)
            .previewLayout(.sizeThatFits)
    }
}
