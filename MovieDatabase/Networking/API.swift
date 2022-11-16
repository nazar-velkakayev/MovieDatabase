//
//  API.swift
//  MovieDatabase
//
//  Created by Belli's MacBook on 16/11/2022.
//

import Foundation


enum API{
    enum Endpoint{
        case popular
        case topRated
        case similar(id: Int)
        case lookup(id: Int)
        
        var url: String{
            var components = URLComponents()
            components.host = "api.themoviedb.org"
            components.scheme = "https"
            
            switch self{
            case .popular:
                //example url: https://api.themoviedb.org/3/movie/popular?api_key=568cd98b3417378bb325cd3b623c9834&language=en-US&page=1
                
                components.path = "/3/movie/popular"
                components.queryItems  = [
                    URLQueryItem(name: "api_key", value: Global.api_key_v3),
                    URLQueryItem(name: "language", value: "en-US"),
                    URLQueryItem(name: "page", value: "1")
                ]
                
                
            case .topRated:
                //example url: https://api.themoviedb.org/3/movie/top_rated?api_key=568cd98b3417378bb325cd3b623c9834&language=en-US&page=1
                
                components.path = "/3/movie/top_rated"
                components.queryItems  = [
                    URLQueryItem(name: "api_key", value: Global.api_key_v3),
                    URLQueryItem(name: "language", value: "en-US"),
                    URLQueryItem(name: "page", value: "1")
                ]
                
                
            case .similar(let id):
                //example url: https://api.themoviedb.org/3/movie/505642/similar?api_key=568cd98b3417378bb325cd3b623c9834&language=en-US&page=1
                
                components.path = "/3/movie/\(id)/similar"
                components.queryItems  = [
                    URLQueryItem(name: "api_key", value: Global.api_key_v3),
                    URLQueryItem(name: "language", value: "en-US"),
                    URLQueryItem(name: "page", value: "1")
                    
                ]
                
                
            case .lookup(let id):
                //example url: https://api.themoviedb.org/3/movie/505642?api_key=568cd98b3417378bb325cd3b623c9834&language=en-US
                
                components.path = "/3/movie/\(id)"
                components.queryItems  = [
                    URLQueryItem(name: "api_key", value: Global.api_key_v3),
                    URLQueryItem(name: "language", value: "en-US")
                    
                ]
            }
            
            return components.url?.absoluteString ?? ""
        }
    }
}
