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
            AnimatedImage(url: URL(string: API.Endpoint.image(endpoint: image).url))
                .resizable()
                .placeholder{
                    ShimmerEffect(width: 60, height: 60)
                        .frame(width: 60, height: 60)
                        .clipShape(Circle())
                        .clipped()
                    
                }
                .scaledToFill()
                .frame(width: 60, height: 60)
                .clipShape(Circle())
            
            Text("\(devideName().name)\n\(devideName().surname)")
                .foregroundColor(.gray)
                .font(.system(size: 11, weight: .semibold))
                .multilineTextAlignment(.center)

        }
        .padding(5)
    }
    
    private func devideName()->(name: String, surname: String){
        let separated = name.components(separatedBy: " ")
        
        return (separated.first ?? "", separated.last ?? "")
    }
}

struct CastCardView_Previews: PreviewProvider {
    static var previews: some View {
        CastCardView(image: "/bCjz32aVpyufnPjzLPOtV5DEXKK.jpg",
                     name: "Danai Gurira",
                     character: "Okoye")
    }
}
