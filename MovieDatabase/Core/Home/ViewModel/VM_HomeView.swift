//
//  VM_HomeView.swift
//  MovieDatabase
//
//  Created by Belli's MacBook on 13/11/2022.
//

import Foundation
import Combine


class VM_HomeView: ObservableObject{
    @Published var popularMovies: [MovieModel] = []
    @Published var topRatedMovies: [MovieModel] = []
    @Published var tvShowList: [TVShowModel] = []
    
    private var cancellables = Set<AnyCancellable>()
    private let movieListDataService = MovieListDataService()
    private let tvSHowListDataService = TVSHowDataService()
    
    init(){
        getMovies()
    }
    
    //MARK: popular
    private func getMovies(){
        movieListDataService.$popularMovies
            .sink {[weak self] returnedList in
                guard let self = self else{return}
                
                self.popularMovies = returnedList
            }
            .store(in: &cancellables)
        
        movieListDataService.$topRatedMovies
            .sink {[weak self] returnedList in
                guard let self = self else{return}
                self.topRatedMovies = returnedList
            }
            .store(in: &cancellables)
        
        tvSHowListDataService.$tvShowList
            .sink {[weak self] returnedTVShowList in
                guard let self = self else{return}
                
                self.tvShowList = returnedTVShowList
            }
            .store(in: &cancellables)
        
    }
}
