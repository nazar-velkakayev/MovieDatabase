//
//  HomeView.swift
//  MovieDatabase
//
//  Created by Belli's MacBook on 12/11/2022.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var vm_homeView: VM_HomeView
    
    var body: some View {
        ZStack{
            Color("color_background")
                .edgesIgnoringSafeArea(.all)
            
            
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 20){
                    HStack(alignment: .bottom, spacing: 1){
                        Text("Naz")
                        Text("ar")
                            .foregroundColor(Color("color_red"))
                        
                    }
                    .font(.system(size: 40, weight: .semibold))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom)
                    
                    
                    //popular
                    movieCategory(title: "Popular Movies", dataArray: vm_homeView.popularMovies, size: (200, 250))
                    
                    //top rated
                    movieCategory(title: "Top Rated Movies", dataArray: vm_homeView.topRatedMovies, size: (170, 220))

                }
                .padding()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView()
                .environmentObject(VM_HomeView())
        }
        .navigationBarHidden(true)
    }
}


extension HomeView{
    @ViewBuilder private func movieCategory(title: String, dataArray: [MovieModel], size: (width: CGFloat, height: CGFloat))-> some View{
        VStack{
            Text(title)
                .foregroundColor(.white)
                .font(.system(size: 20, weight: .semibold))
                .frame(maxWidth: .infinity, alignment: .leading)


            ScrollView(.horizontal, showsIndicators: false){
                HStack(spacing: 20){
                    ForEach(dataArray){movie in
                        NavigationLink {
                            MovieDetailsView(movie: movie)
                                .navigationBarHidden(true)
                                .environmentObject(vm_homeView)
                        } label: {
                            MovieCardView(movie: movie, width: size.width, height: size.height)
                        }
                    }
                }
                .padding(.leading)
            }
            .padding(.leading, -15)
        }
    }
}
