//
//  MovieCreditsDataService.swift
//  MovieDatabase
//
//  Created by Belli's MacBook on 16/11/2022.
//

import Foundation
import Combine


class MovieCreditsDataService{
    @Published var movieCredits: [MovieCredit] = []
    
    private var movieCreditSubscription: AnyCancellable?
    
    init(movie: MovieModel){
        getAllCredits(movieID: movie.id)
    }
    
    
    private func getAllCredits(movieID: Int){
        guard let url = URL(string: API.Endpoint.credits(id: movieID).url) else{
            print("\n invalid movie credit url")
            return
        }
        movieCreditSubscription = NetworkingManger.download(url: url)
            .decode(type: MovieCreditsResponse.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManger.handleComlition, receiveValue: {[weak self] returnedMovieCreditModel in
                guard let self = self else{return}
                var sorted = returnedMovieCreditModel.cast.sorted(by: {$0.popularity > $1.popularity})
                
                sorted = Array(sorted.self[...10])
                
                self.movieCredits = sorted
                
                
                self.movieCreditSubscription?.cancel()
                
                print("\n movie credits downloaded successfully")
            })
    }
}
