//
//  HomeView.swift
//  MovieDatabase
//
//  Created by Belli's MacBook on 12/11/2022.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var vm_homeView: VM_HomeView
    @State private var selectedIndex: Int = 1
    
    var body: some View {
        ZStack(alignment: .top){
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
                    if !vm_homeView.popularMovies.isEmpty{
                        movieCategory(title: "Popular Movies", dataArray: vm_homeView.popularMovies, size: (150, 200))
                    }else{
                        loadingCardAnimation(title: "Popular Movies", size: (150, 200))
                    }
                    
                    //top rated
                    if !vm_homeView.topRatedMovies.isEmpty{
                        movieCategory(title: "Top Rated Movies", dataArray: vm_homeView.topRatedMovies, size: (120, 170))
                    }else{
                        loadingCardAnimation(title: "Top Rated Movies", size: (120, 170))
                    }

                }
                .padding()
                .padding(.bottom, 100)
            }
            
            CustomTabbar(selectedIndex: $selectedIndex)
                .offset(y: UIScreen.main.bounds.height - 150)
                .zIndex(2)
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
    
    @ViewBuilder private func loadingCardAnimation(title: String, size: (width: CGFloat, height: CGFloat))-> some View{
        VStack{
            Text(title)
                .foregroundColor(.white)
                .font(.system(size: 20, weight: .semibold))
                .frame(maxWidth: .infinity, alignment: .leading)


            ScrollView(.horizontal, showsIndicators: false){
                HStack(spacing: 20){
                    ForEach(0..<10){movie in
                        ShimmerEffect(width: size.width, height: size.height)
                    }
                }
                .padding(.leading)
            }
            .padding(.leading, -15)
        }
    }
}
