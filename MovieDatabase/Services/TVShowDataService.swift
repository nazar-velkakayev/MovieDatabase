//
//  TVShowDataService.swift
//  MovieDatabase
//
//  Created by Belli's MacBook on 15/11/2022.
//

import Foundation
import Combine


class TVSHowDataService{
    @Published var tvShowList: [TVShowModel] = []
    
    private var tvShowSubscription: AnyCancellable?
    
    init(){
        getTVShowList()
    }
    
    private func getTVShowList(){
        guard let url = URL(string: "https://api.themoviedb.org/3/tv/popular?api_key=568cd98b3417378bb325cd3b623c9834&language=en-US&page=1") else{
            print("\n invalid tv show url")
            return
        }
        
        tvShowSubscription = NetworkingManger.download(url: url)
            .decode(type: TVShowResponse.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManger.handleComlition, receiveValue: {[weak self] returnedTVShowList in
                guard let self = self else{return}
                
                self.tvShowList = returnedTVShowList.results
                self.tvShowSubscription?.cancel()
                print("\n tv show list downloaded successfully")
            })
    }
}
