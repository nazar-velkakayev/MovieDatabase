//
//  PreviewProvider.swift
//  MovieDatabase
//
//  Created by Belli's MacBook on 13/11/2022.
//

import Foundation
import SwiftUI

extension PreviewProvider{
    static var dev: DeveloperPreview{
        return DeveloperPreview.instance
    }
}


class DeveloperPreview{
    static let instance = DeveloperPreview()
    init(){}
    
    let vm_homeView = VM_HomeView()
    
    let movie1 = MovieModel(adult: false,
                            backdropPath: "/7ZO9yoEU2fAHKhmJWfAc2QIPWJg.jpg",
                            genreIDS: [
                                53,
                                28,
                                878
                            ],
                            id: 766507,
                            originalLanguage: "en",
                            originalTitle: "Prey",
                            overview: "When danger threatens her camp, the fierce and highly skilled Comanche warrior Naru sets out to protect her people. But the prey she stalks turns out to be a highly evolved alien predator with a technically advanced arsenal.",
                            popularity: 953.887,
                            posterPath: "/ujr5pztc1oitbe7ViMUOilFaJ7s.jpg",
                            releaseDate: "2022-08-05",
                            title: "Prey",
                            video: false,
                            voteAverage: 7.9,
                            voteCount: 4573)
}


/*
 
 "adult": false,
             "backdrop_path": "/7ZO9yoEU2fAHKhmJWfAc2QIPWJg.jpg",
             "genre_ids": [
                 53,
                 28,
                 878
             ],
             "id": 766507,
             "original_language": "en",
             "original_title": "Prey",
             "overview": "When danger threatens her camp, the fierce and highly skilled Comanche warrior Naru sets out to protect her people. But the prey she stalks turns out to be a highly evolved alien predator with a technically advanced arsenal.",
             "popularity": 953.887,
             "poster_path": "/ujr5pztc1oitbe7ViMUOilFaJ7s.jpg",
             "release_date": "2022-08-05",
             "title": "Prey",
             "video": false,
             "vote_average": 7.9,
             "vote_count": 4573
 
 */
