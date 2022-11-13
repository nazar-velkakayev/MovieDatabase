//
//  MovieCardView.swift
//  MovieDatabase
//
//  Created by Belli's MacBook on 13/11/2022.
//

import SwiftUI

struct MovieCardView: View {
    
    let name: String
    let releaseDate: String
    let i: Int
    
    var body: some View {
        VStack {
            ZStack{
                Color.white
                VStack{
                    Text("\(i)")
                }
            }
            .cornerRadius(20)
            .frame(width: 200, height: 250)
            
            VStack(alignment: .leading){
                Text(name)
                    .foregroundColor(.white)
                    .font(.system(size: 17, weight: .semibold))
                
                
                Text(releaseDate)
                    .foregroundColor(.gray)
                    .font(.system(size: 15, weight: .medium))
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

struct MovieCardView_Previews: PreviewProvider {
    static var previews: some View {
        MovieCardView(name: "Wonder Women",
                      releaseDate: "July 12, 3933",
                      i: 1)
        .previewLayout(.sizeThatFits)
    }
}
