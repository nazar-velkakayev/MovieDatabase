//
//  MovieDetailsView.swift
//  MovieDatabase
//
//  Created by Belli's MacBook on 13/11/2022.
//

import SwiftUI

struct MovieDetailsView: View {
    @Environment(\.presentationMode) private var presentationMode
    
    var body: some View {
        ZStack(alignment: .top){
            Color("color_background")
            
            HStack{
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    ZStack{
                        Color("color_background")
                        
                        Image(systemName: "chevron.left")
                            .foregroundColor(.white)
                            .font(.headline)
                            .padding()
                    }
                    .clipShape(Circle())
                    .frame(width: 30, height: 30)
                }
                
                Spacer()
            }
            .zIndex(1)
            .padding(.leading, 20)
            .padding(.top, 40)
//            Image("img_example")
//                .resizable()
//                .scaledToFit()
//                .frame(width: UIScreen.main.bounds.width)
            
            ScrollView(showsIndicators: false){
                headerImage()
                
                VStack(alignment: .leading){
                    
                    //MARK: movie rank
                    movieRank(score: 6)
                    
                    Text("After being resurrected by a sinister entity, Art the Clown returns to Miles County where he must hunt down and destroy a teenage girl and her younger brother on Halloween night.  As the body count rises, the siblings fight to stay alive while uncovering the true nature of Art's evil intent.")
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.leading)
                        .font(.system(size: 15, weight: .regular))
                        .padding(.top)

                }
                .padding()
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
    
    private func colorRank(i: Int, score: Double) -> Bool{
        return Double(score / 2) >= Double(i + 1)
    }
}

struct MovieDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailsView()
    }
}


extension MovieDetailsView{
    //MARK: Header View
    @ViewBuilder private func headerImage() -> some View{
        GeometryReader{ proxy in
            let minY = proxy.frame(in: .named("SCROLL")).minY
            let size = proxy.size
            let height = size.height + minY
            
            Image("img_example")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: size.width, height: height > 0 ? height : 0, alignment: .top)
                .overlay{
                    ZStack(alignment: .bottom){
                        LinearGradient(colors: [.clear, Color("color_background")], startPoint: .top, endPoint: .bottom)
                        
                        VStack(spacing: 5){
                            Text("Joker")
                                .foregroundColor(.white)
                                .font(.system(size: 30, weight: .bold))
                            
                            Text("2022 • Adventure, Action • 2 h 15 min")
                                .foregroundColor(.gray)
                                .font(.system(size: 15, weight: .medium))
                            
                        }
                        .padding(.bottom)
                    }
                }
                .cornerRadius(10)
                .offset(y: -minY)
        }
        .frame(height: 350)
    }
    
    @ViewBuilder private func movieRank(score: Double)-> some View{
        HStack{
            ForEach(0..<5){i in
                Image(systemName: "star.fill")
                    .font(.callout)
                    .foregroundColor(colorRank(i: i, score: score) ? .yellow : .gray)
            }
        }
        .frame(maxWidth: .infinity, alignment: .center)
    }
}
