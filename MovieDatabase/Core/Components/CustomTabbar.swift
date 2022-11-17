//
//  CustomTabbar.swift
//  MovieDatabase
//
//  Created by Belli's MacBook on 17/11/2022.
//

import SwiftUI

struct CustomTabbar: View {
    @Binding var selectedIndex: Int
    
    let textSize: CGFloat = 17
    
    var body: some View {
        ZStack{
            Color("color_red")
                .cornerRadius(40)
            
            
            HStack{
                
                tabItem(index: 1, title: "Home", image: "house")
                 
                Spacer()
                
                tabItem(index: 2, title: "Play", image: "play.circle")
                
                Spacer()
                
                tabItem(index: 3, title: "Saved", image: "bookmark")
                
                Spacer()
                
                tabItem(index: 4, title: "Profile", image: "person")

            }
            .padding(.horizontal)
        }
        .frame(height: 70)
        .padding(.horizontal)
        .foregroundColor(.white)
    }
}

struct CustomTabbar_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabbar(selectedIndex: .constant(2))
    }
}


extension CustomTabbar{
    @ViewBuilder private func tabItem(index: Int, title: String, image: String)-> some View{
        ZStack(alignment: .center){
            Color.white.opacity(0.3)
                .cornerRadius(20)
            
            HStack{
                
                Image(systemName: selectedIndex == index ? "\(image).fill" : image)
                    .font(.system(size: 25, weight: .bold))
                    .foregroundColor(.white.opacity(selectedIndex == index ? 1 : 0.6))
                
                if selectedIndex == index{
                    Text(title)
                        .font(.system(size: textSize, weight: .semibold))
                        .minimumScaleFactor(0.8)
                }
            }
        }
        .clipped()
        .frame(width: selectedIndex == index ? 120 : 50, height: 40)
        .onTapGesture {
            withAnimation(.linear(duration: 0.2)){
                selectedIndex = index
            }
        }
    }
}
