//
//  CastCardView.swift
//  MovieDatabase
//
//  Created by Belli's MacBook on 17/11/2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct CastCardView: View {
    let image: String?
    
    let name: String
    let character: String?
    
    var body: some View {
        VStack{
            AnimatedImage(url: URL(string:"https://image.tmdb.org/t/p/w500\(image ?? "")"))
                .resizable()
                .placeholder{
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.gray)
                        .frame(width: 60, height: 60)
                }
                .scaledToFill()
                .frame(width: 60, height: 60)
                .clipShape(Circle())
            
            Text(name)
                .foregroundColor(.gray)
                .font(.system(size: 13, weight: .semibold))

        }
    }
}

struct CastCardView_Previews: PreviewProvider {
    static var previews: some View {
        CastCardView(image: "/bCjz32aVpyufnPjzLPOtV5DEXKK.jpg",
                     name: "Danai Gurira",
                     character: "Okoye")
    }
}
