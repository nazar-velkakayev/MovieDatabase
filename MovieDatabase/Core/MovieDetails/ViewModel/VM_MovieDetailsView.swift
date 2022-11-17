//
//  VM_MovieDetailsView.swift
//  MovieDatabase
//
//  Created by Belli's MacBook on 14/11/2022.
//

import Foundation
import Combine

class VM_MovieDetailsView: ObservableObject{
    @Published var movieDetails: MovieDetailModel?
    @Published var similarMovies: [MovieModel] = []
    @Published var movieCredits : [MovieCredit] = []
        
    private let movieDetailDataService: MovieDetailsDataService
    private let similarMoviesListDataService: SimilarMoviesListDataService
    private let movieCreditsSubscription: MovieCreditsDataService
    
    private var cancellables = Set<AnyCancellable>()
    
    init(movie: MovieModel){
        self.movieDetailDataService = MovieDetailsDataService(movie: movie)
        self.similarMoviesListDataService = SimilarMoviesListDataService(movie: movie)
        self.movieCreditsSubscription = MovieCreditsDataService(movie: movie)
        
        addMovieDetailsSubscription()
    }
    
    
    private func addMovieDetailsSubscription(){
        movieDetailDataService.$movieDetailModel
            .sink {[weak self] returnedMovieDetails in
                guard let self = self else{return}
                self.movieDetails = returnedMovieDetails
            }
            .store(in: &cancellables)
        
        similarMoviesListDataService.$similarMovies
            .sink {[weak self] returnedSimilarMovies in
                guard let self = self else{return}
                
                self.similarMovies = returnedSimilarMovies
                
            }
            .store(in: &cancellables)
        
        movieCreditsSubscription.$movieCredits
            .sink { [weak self] returnedCredits in
                guard let self = self else{return}
                
                self.movieCredits = returnedCredits
                
            }
            .store(in: &cancellables)
    }
    
    var areCountriesAvailable: Bool{
        guard let details = movieDetails,
              let countries = details.productionCountries else{return false}
        
        return countries.isEmpty
        

    }
    
    var areAvailableProductionCompanies: Bool{
        guard let details = movieDetails,
              let companies = details.productionCompanies else{return false}
        
        return companies.isEmpty
        
    }
    
    var isAvailableMovieLink: Bool{
        guard let details = movieDetails,
              let _ = URL(string: details.homepage) else{return false}

        return true
    }
}
