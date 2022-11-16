//
//  MovieListDataService.swift
//  MovieDatabase
//
//  Created by Belli's MacBook on 12/11/2022.
//

import Foundation
import Combine


class MovieListDataService{
    @Published var popularMovies: [MovieModel] = []
    @Published var topRatedMovies: [MovieModel] = []
    
    private var popularMovieSubscription: AnyCancellable?
    private var topRatedMovieSubscription: AnyCancellable?
    
    init(){
        getPopularMovies()
        getTopRatedMovies()
    }
    
        
    private func getPopularMovies(){
//        guard let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=568cd98b3417378bb325cd3b623c9834&language=en-US&page=1") else {
//            print("\n invalid popular movie list url:")
//            return
//        }
//
        guard let url = URL(string: API.Endpoint.popular.url) else{
            print("\n invalid popular movie list url:")
            return
        }
        
        popularMovieSubscription = NetworkingManger.download(url: url)
            .decode(type: MovieResponse.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManger.handleComlition, receiveValue: {[weak self] returnedMovies in
                guard let self = self else{return}
                
                self.popularMovies = returnedMovies.results
                self.popularMovieSubscription?.cancel()
                print("\n popular movie list returned successfully")
            })
    }
    
    private func getTopRatedMovies(){
//        guard let url = URL(string: "https://api.themoviedb.org/3/movie/top_rated?api_key=568cd98b3417378bb325cd3b623c9834&language=en-US&page=1") else {
//            print("\n invalid top-rated movie list url")
//            return
//        }
        
        guard let url = URL(string: API.Endpoint.topRated.url) else{
            print("\n invalid popular movie list url:")
            return
        }
        
        topRatedMovieSubscription = NetworkingManger.download(url: url)
            .decode(type: MovieResponse.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManger.handleComlition, receiveValue: {[weak self] returnedMovies in
                guard let self = self else{return}
                
                self.topRatedMovies = returnedMovies.results
                self.topRatedMovieSubscription?.cancel()
                print("\n top-rated movie list returned successfully")
            })
    }
}
