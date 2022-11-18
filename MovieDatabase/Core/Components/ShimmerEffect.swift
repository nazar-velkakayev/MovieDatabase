//
//  ShimmerEffect.swift
//  MovieDatabase
//
//  Created by Belli's MacBook on 16/11/2022.
//

import SwiftUI
import Shimmer

struct ShimmerEffect: View {
   // @State private var start: Bool = false
    
    let width: CGFloat
    let height: CGFloat
    
    let speed: Double
    
    let center = UIScreen.main.bounds.width
    
    var body: some View {
        ZStack{
            Color("color_background")
                .frame(width: width, height: height)
                .cornerRadius(10)
            
            Color.white
                .frame(width: width * 2, height: height * 2)
                .cornerRadius(10)
                .shimmering()
        }
        .clipped()
    }
}

struct ShimmerEffect_Previews: PreviewProvider {
    static var previews: some View {
        ShimmerEffect(width: 200, height: 250, speed: 0.3)
    }
}
