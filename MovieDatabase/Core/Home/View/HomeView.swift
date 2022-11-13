//
//  HomeView.swift
//  MovieDatabase
//
//  Created by Belli's MacBook on 12/11/2022.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack{
            Color("color_background")
                .edgesIgnoringSafeArea(.all)
            
            
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading){
                    HStack(spacing: 0){
                        Text("Naz")
                        Text("ar")
                            .foregroundColor(Color("color_red"))
                        
                    }
                    .font(.system(size: 40, weight: .semibold))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom)
                    
                    
                    //MARK: Popular movie
                    VStack{
                        sectionTitle(title: "Popular movie")
                        ScrollView(.horizontal, showsIndicators: false){
                            HStack(spacing: 20){
                                ForEach(0..<10){i in
                                    MovieCardView(name: "Movie Name \(i)",
                                                  releaseDate: "Release Date \(i)",
                                                  i: i)
                                }
                            }
                            .padding(.leading)
                          //  .border(.red, width: 20)
                        }
                        //.offset(x: -20)
                        .padding(.leading, -15)

                    }
                }
                .padding()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}


extension HomeView{
    @ViewBuilder private func sectionTitle(title: String)-> some View{
        Text(title)
            .foregroundColor(.white)
            .font(.system(size: 20, weight: .semibold))
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}
