//
//  SimilarMoviesList.swift
//  MovieDatabase
//
//  Created by Belli's MacBook on 15/11/2022.
//

import Foundation
import Combine

class SimilarMoviesListDataService{
    @Published var similarMovies: [MovieModel] = []
    
    private var similarMoviesSubscription: AnyCancellable?
    
    
    init(movie: MovieModel){
        getSimilarMovies(movieID: movie.id)
    }
    
    
    private func getSimilarMovies(movieID: Int){
        guard let url = URL(string: API.Endpoint.similar(id: movieID).url) else{
            print("\n invalid similar movie url")
            return
        }
        
        similarMoviesSubscription = NetworkingManger.download(url: url)
            .decode(type: MovieResponse.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManger.handleComlition, receiveValue: {[weak self] returnedSimilarMovies in
                guard let self = self else{return}
                
                self.similarMovies = returnedSimilarMovies.results
                self.similarMoviesSubscription?.cancel()
                print("\n similar movies downloaded successfully")
                
            })
    }
}
