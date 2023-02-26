//
//  Service.swift
//  davaleba24
//
//  Created by anzori  on 2/24/23.
//  Copyright © 2023 anzori . All rights reserved.
//

import Foundation
import UIKit
class Service {
    private let apiKey = "cf96c1926bfa5071175c0b9d3bed1440"
    private let webservismanager: WebServiceManaging
  //  static let shared = Service()
    
    init(webservismanager: WebServiceManaging) {
        self.webservismanager = webservismanager
    }
    
    
    func fetchMovies(completion: @escaping (([MovieInfo]) -> Void)){
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=\(apiKey)&language=en-US&page=1") else {
            return
        }
        let urlString = url.absoluteString
        webservismanager.get(url: urlString) { (MovieResponses: MovieResponses?, error: Error?) in
            if let error = error {
                return
            }
            guard let responce = MovieResponses?.results else {
                return
            }
            DispatchQueue.main.async {
                    completion(responce)
                }
            
        }
    }
    
    func fetchSimilarMovies(as movieId: Int, completion: @escaping (([MovieInfo]) -> Void)) {
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/\(movieId)/similar?api_key=\(apiKey)&language=en-US&page=1")
            else { return }
        
        let urlString = url.absoluteString
        webservismanager.get(url: urlString) { (MovieResponses: MovieResponses?, error: Error?) in
            if let error = error {
                return
            }
            guard let responce = MovieResponses?.results else {
                return
            }
            DispatchQueue.main.async {
                    completion(responce)
                }
            
        }
        
    }
    
    static func getMovieImage(from imageUrl: String, completion: @escaping (UIImage?) -> Void) {
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500\(imageUrl)") else { return }

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data {
                       let image = UIImage(data: data)
                       DispatchQueue.main.async {
                           completion(image)
                       }
                   } else {
                       completion(nil)
                       print(error ?? "")
                   }
        }.resume()
    }
    

}
