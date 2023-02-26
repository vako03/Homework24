//
//  WebServiceManaging.swift
//  davaleba24
//
//  Created by anzori  on 2/24/23.
//  Copyright © 2023 anzori . All rights reserved.
//

import UIKit

protocol WebServiceManaging: AnyObject {
    func get<T: Decodable>(url: String, completion: @escaping ((T?, Error?) -> Void))
}

class WebServiceManager: WebServiceManaging {
  func get<T: Decodable>(url: String, completion: @escaping ((T?, Error?) -> Void)) {
       guard let url = URL(string: url) else {
           return
       }
       
       URLSession.shared.dataTask(with: url) { data, response, error in
           if let error = error {
               completion(nil, error)
               return
           }
           
           guard let data = data else {
               completion(nil, NSError(domain: "No data received", code: 0, userInfo: nil))
               return
           }
           
           do {
               let decoded = try JSONDecoder().decode(T.self, from: data)
               completion(decoded, nil)
           } catch {
               completion(nil, error)
           }
       }
       .resume()
   }


   
}

