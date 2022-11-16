//
//  MovieDetailsDataService.swift
//  MovieDatabase
//
//  Created by Belli's MacBook on 14/11/2022.
//

import Foundation
import Combine

class MovieDetailsDataService{
    @Published var movieDetailModel: MovieDetailModel?
    private var movieDetailSubscription: AnyCancellable?
        
    init(movie: MovieModel){
        getMovieDetails(movieID: movie.id)
    }
    
    
    private func getMovieDetails(movieID: Int){
        guard let url = URL(string: API.Endpoint.lookup(id: movieID).url) else{
            print("\n invalid movie details url:")
            return
        }
        
        movieDetailSubscription = NetworkingManger.download(url: url)
            .decode(type: MovieDetailModel.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManger.handleComlition, receiveValue: {[weak self] returnedMovieDetails in
                guard let self = self else{return}
                
                self.movieDetailModel = returnedMovieDetails
                self.movieDetailSubscription?.cancel()
                print("\n movie details downloaded successfully")
                
            })
    }
}
