//
//  Service.swift
//  davaleba24
//
//  Created by anzori  on 2/24/23.
//  Copyright © 2023 anzori . All rights reserved.
//

import Foundation
class Service {
    let apiKey = "cf96c1926bfa5071175c0b9d3bed1440"
    private let webservismanager: WebServiceManaging
    
    init(webservismanager:WebServiceManaging) {
        self.webservismanager = webservismanager
    }
    func fetchUsers(completion: @escaping (([MovieInfo]) -> Void)){
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

}
