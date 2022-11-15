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
                    
                    
                    //MARK: Popular movies
                    VStack{
                        sectionTitle(title: "Popular movies")
                        ScrollView(.horizontal, showsIndicators: false){
                            HStack(spacing: 20){
                                ForEach(vm_homeView.popularMovies){movie in
                                    NavigationLink {
                                        MovieDetailsView(movie: movie)
                                            .navigationBarHidden(true)
                                            .environmentObject(vm_homeView)
                                    } label: {
                                        MovieCardView(movie: movie)
                                    }
                                }
                            }
                            .padding(.leading)
                        }
                        .padding(.leading, -15)
                    }
                    
                    //MARK: top rated movies
                    VStack{
                        sectionTitle(title: "Top Rated movies")
                        ScrollView(.horizontal, showsIndicators: false){
                            HStack(spacing: 20){
                                ForEach(vm_homeView.topRatedMovies){movie in
                                    NavigationLink {
                                        MovieDetailsView(movie: movie)
                                            .navigationBarHidden(true)
                                            .environmentObject(vm_homeView)
                                    } label: {
                                        MovieCardView(movie: movie)

                                    }

                                }
                            }
                            .padding(.leading)
                        }
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
        NavigationView {
            HomeView()
                .environmentObject(VM_HomeView())
        }
        .navigationBarHidden(true)
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
