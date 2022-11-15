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
        
    private let movieDetailDataService: MovieDetailsDataService
    private let similarMoviesListDataService: SimilarMoviesListDataService
    
    private var cancellables = Set<AnyCancellable>()
    
    init(movie: MovieModel){
        self.movieDetailDataService = MovieDetailsDataService(movie: movie)
        self.similarMoviesListDataService = SimilarMoviesListDataService(movie: movie)
        
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
    }
}


//error build: Undefined symbol: _$s13MovieDatabase0A11DetailModelV5adult12backdropPath19belongsToCollection6budget6genres8homepage2id6imdbID16originalLanguage0Q5Title8overview10popularity06posterG019productionCompanies0W9Countries11releaseDate7revenue7runtime15spokenLanguages6status7tagline5title5video11voteAverage9voteCountACSb_SSAA07BelongsiJ0VSgSiSayAA5GenreVGSSSiS4SSdSSSayAA17ProductionCompanyVGSgSayAA17ProductionCountryVGSgSSS2iSgSayAA06SpokenR0VGS3SSbSgSdSitcfC

