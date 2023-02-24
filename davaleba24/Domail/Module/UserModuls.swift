//
//  UserModuls.swift
//  davaleba24
//
//  Created by anzori  on 2/24/23.
//  Copyright © 2023 anzori . All rights reserved.
//

import Foundation


struct MovieInfo: Decodable {
        let title: String
        let vote_average: Double
        let poster_path: String
        let overview:String
        let release_date:String
}
