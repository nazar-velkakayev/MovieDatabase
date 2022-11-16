//
//  DetailsCompanyCardView.swift
//  MovieDatabase
//
//  Created by Belli's MacBook on 14/11/2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct DetailsCompanyCardView: View {
    let image: String?
    let name: String
    
    var body: some View {
        VStack{
                AnimatedImage(url: URL(string:"https://image.tmdb.org/t/p/w500\(image ?? "")"))
                    .resizable()
                    .placeholder{
                        Circle()
                            .fill(.gray)
                            .frame(width: 50, height: 50)
                    }
                    .scaledToFill()
                    .clipped()
                    .frame(width: 100, height: 100)


            Text(name)
                .foregroundColor(.white)
                .font(.system(size: 13, weight: .semibold))
                .frame(width: 150)
                .multilineTextAlignment(.center)
                            
        }
    }
}

struct DetailsCompanyCardView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsCompanyCardView(image: "/GagSvqWlyPdkFHMfQ3pNq6ix9P.png", name: "New Line Cinema")
    }
}
