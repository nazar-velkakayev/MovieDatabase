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
    
    private var cancellables = Set<AnyCancellable>()
    private let movieListDataService = MovieListDataService()
    
    init(){
        getMovies()
    }
    
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
        
    }
}
