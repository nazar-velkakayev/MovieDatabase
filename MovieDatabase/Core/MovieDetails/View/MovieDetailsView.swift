//
//  MovieDetailsView.swift
//  MovieDatabase
//
//  Created by Belli's MacBook on 13/11/2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct MovieDetailsView: View {
    @Environment(\.presentationMode) private var presentationMode
    
    @EnvironmentObject private var vm_homeView: VM_HomeView
    
    @StateObject private var vm_movieDetailsView: VM_MovieDetailsView
        
    let movie: MovieModel
    
    init(movie: MovieModel){
        self.movie = movie
        _vm_movieDetailsView = StateObject(wrappedValue: VM_MovieDetailsView(movie: movie))
    }
    
    
    var body: some View {
        ZStack(alignment: .top){
            Color("color_background")
            
            backButton

            
            ScrollView(showsIndicators: false){
                headerImage()
                
                VStack(alignment: .leading){
                    
                    movieRank
                    
                    Text(movie.overview)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.leading)
                        .font(.system(size: 15, weight: .regular))
                        .padding(.top)
                
                    VStack(alignment: .leading, spacing: 20){
                        
                        if let details = vm_movieDetailsView.movieDetails,
                           let companies = details.productionCompanies,
                           !companies.isEmpty{
                            VStack(alignment: .leading, spacing: 5){
                                Text("Production Companies")
                                    .foregroundColor(.white)
                                    .font(.headline)
                                VStack(alignment: .leading){
                                    ForEach(companies) { company in
                                        Text("\t • \(company.name)")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 14, weight: .medium))
                                    }
                                }
                            }
                        }
                        
                        
                        if let details = vm_movieDetailsView.movieDetails,
                           let countries = details.productionCountries,
                           !countries.isEmpty{
                            VStack(alignment: .leading, spacing: 5){
                                Text("Production Countries")
                                    .foregroundColor(.white)
                                    .font(.headline)
                                VStack(alignment: .leading){
                                    ForEach(countries) { country in
                                        Text("\t • \(country.name)")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 14, weight: .medium))
                                    }
                                }
                            }
                            
                        }

                    }
                    .padding(.top)
                    
                    VStack(alignment: .leading){
                        Text("Similar Movies")
                            .foregroundColor(.white)
                            .font(.system(size: 20, weight: .bold))
                        
                    
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack(spacing: 20){
                            ForEach(vm_movieDetailsView.similarMovies){movie in
                                NavigationLink {
                                    MovieDetailsView(movie: movie)
                                        .navigationBarHidden(true)
                                        .environmentObject(vm_homeView)
                                } label: {
                                    MovieCardView(movie: movie, width: 200, height: 250)
                                }
                            }
                        }
                        .padding(.leading)
                    }
                    .padding(.leading, -15)
                    .padding(.bottom, 100)
                    }
                    .padding(.top)

                }
                .padding()
            }
        }
        .edgesIgnoringSafeArea(.all)
        .overlay (watchButton() ,alignment: .bottom)
    }
    
    private func colorRank(i: Int, score: Double) -> Bool{
        return Double(score / 2) >= Double(i + 1)
    }
}

struct MovieDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MovieDetailsView(movie: dev.movie1)
                .navigationBarHidden(true)
                .environmentObject(VM_HomeView())
        }
    }
}


extension MovieDetailsView{
    //MARK: back button
    @ViewBuilder private var backButton: some View{
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
            
            NavigationLink {
                HomeView()
                    .navigationBarHidden(true)
                    .environmentObject(vm_homeView)
            } label: {
                ZStack{
                    Color("color_background")
                    
                    Image(systemName: "house")
                        .foregroundColor(.white)
                        .font(.headline)
                        .padding()
                }
                .clipShape(Circle())
                .frame(width: 30, height: 30)
            }
        }
        .zIndex(1)
        .padding(.horizontal, 20)
        .padding(.top, 40)

    }
    
    //MARK: header image
    @ViewBuilder private func headerImage() -> some View{
        GeometryReader{ proxy in
            let minY = proxy.frame(in: .named("SCROLL")).minY
            let size = proxy.size
            let height = size.height + minY
            
            //Image("img_example")
            AnimatedImage(url: URL(string: movie.posterURL))
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: size.width, height: height > 0 ? height : 0, alignment: .top)
                .overlay{
                    ZStack(alignment: .bottom){
                        LinearGradient(colors: [.clear, Color("color_background")], startPoint: .top, endPoint: .bottom)
                        
                        VStack{
                            Text(movie.originalTitle)
                                .foregroundColor(.white)
                                .font(.system(size: 30, weight: .bold))
                                .multilineTextAlignment(.center)
                            
                            if let movieDetails = vm_movieDetailsView.movieDetails{
                                Text(movieDetails.tagline)
                                    .foregroundColor(.white)
                                    .font(.system(size: 15, weight: .bold))
                                    .multilineTextAlignment(.center)

                            }
                           
                            
                              //  ScrollView(.horizontal, showsIndicators: false){
                                    HStack{
                                        Text(movie.releaseDate.asYear())
                                        Text("•")
                                        
                                        if let movieDetails = vm_movieDetailsView.movieDetails{
                                            ForEach(movieDetails.genres){ genre in
                                                Text(genre.name + " • ")
                                            }
                                            
                                          //  Text(movieDetails.runtime?.minutesToHoursAndMinutes() ?? "")
                                        }
                                        
                                    }
                                    .font(.system(size: 15, weight: .medium))
                                    .foregroundColor(.gray)
//                                }
//                                .padding(.horizontal)
                            
                                                        
                        }
                    }
                }
                .cornerRadius(10)
                .offset(y: -minY)
        }
        .frame(height: 350)
    }
    
    //MARK: movie rank
    @ViewBuilder private var movieRank: some View{
        HStack(alignment: .top){
            Text(String(format: "%.1f", movie.voteAverage))
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(.yellow)
                .padding(.trailing, 5)
            
            ForEach(0..<5){i in
                Image(systemName: "star.fill")
                    .font(.callout)
                    .foregroundColor(colorRank(i: i, score: movie.voteAverage) ? .yellow : .gray)
            }
            
            Text("(\(movie.voteCount))")
                .font(.caption)
                .foregroundColor(.gray)
                .padding(.trailing, 5)
        }
        .frame(maxWidth: .infinity, alignment: .center)
    }
    
    //MARK: watch button
    @ViewBuilder private func watchButton()-> some View{
        VStack{
            if let details = vm_movieDetailsView.movieDetails,
               let link = URL(string: details.homepage){
                Link(destination: link) {
                    ZStack{
                        Color("color_red")
                        
                        Text("Watch Now")
                            .foregroundColor(.white)
                            .font(.system(size: 20, weight: .bold))
                    }
                    .frame(width: 200, height: 50)
                    .cornerRadius(10)
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .center)
    }
}
