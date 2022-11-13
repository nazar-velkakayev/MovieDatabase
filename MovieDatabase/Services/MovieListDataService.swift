//
//  MovieListDataService.swift
//  MovieDatabase
//
//  Created by Belli's MacBook on 12/11/2022.
//

import Foundation
import Combine


class MovieListDataService{
    @Published var allMovies: [String] = []
    
    var movieSubscription: AnyCancellable?
    
    init(){
        getMovies()
    }
    
    
    private func getMovies(){
        guard let url = URL(string: "") else{
            print("\n invalid movie list url")
            return
        }
        
        movieSubscription = NetworkingManger.download(url: url)
            .decode(type: [String].self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManger.handleComlition, receiveValue: {[weak self] returnedMovies in
                guard let self = self else{return}
                
                self.allMovies = returnedMovies
                self.movieSubscription?.cancel()
                print("\n movie list returned successfully")
            })
    }
    
}
