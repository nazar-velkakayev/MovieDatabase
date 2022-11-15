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
    
    let movieDetails1 = MovieDetailModel(adult: false,
                                         backdropPath: "/bQXAqRx2Fgc46uCVWgoPz5L5Dtr.jpg",
                                         belongsToCollection: BelongsToCollection(id: 12,
                                                                                  name: "Collection",
                                                                                  posterPath: "/google.com",
                                                                                  backdropPath: "232323"),
                                         budget: 200000000,
                                         genres: [Genre(id: 23, name: "Action")],
                                         homepage: "https://www.dc.com/BlackAdam",
                                         id: 436270,
                                         imdbID: "tt6443346",
                                         originalLanguage: "en",
                                         originalTitle: "Black Adam",
                                         overview: "Nearly 5,000 years after he was bestowed with the almighty powers of the Egyptian gods—and imprisoned just as quickly—Black Adam is freed from his earthly tomb, ready to unleash his unique form of justice on the modern world.",
                                         popularity: 3660.328,
                                         posterPath: "/3zXceNTtyj5FLjwQXuPvLYK5YYL.jpg",
                                         productionCompanies: [ProductionCompany(id: 12,
                                                                                 logoPath: "/iaYpEp3LQmb8AfAtmTvpqd4149c.png",
                                                                                 name: "New Line Cinema",
                                                                                 originCountry: "US")],
                                         productionCountries: [ProductionCountry(iso3166_1: "US",
                                                                                 name: "United States of America")],
                                         releaseDate: "2022-10-19",
                                         revenue: 351000000,
                                         runtime: 125,
                                         spokenLanguages: [SpokenLanguage(englishName: "English",
                                                                          iso639_1: "en",
                                                                          name: "English")],
                                         status: "Released",
                                         tagline: "The world needed a hero. It got Black Adam.",
                                         title: "Black Adam",
                                         video: false,
                                         voteAverage: 6.9,
                                         voteCount: 1077)
}

