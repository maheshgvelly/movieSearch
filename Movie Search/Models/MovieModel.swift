//
//  MovieModel.swift
//  Movie Search
//
//  Created by Maglly on 7/3/20.
//  Copyright © 2020 Maglly. All rights reserved.
//

import Foundation
import UIKit


struct MovieResult: Codable {
    let Search:[Movie]
}

struct Movie: Codable {
    let Title: String
    let Year: String
    let imdbID: String
    let _Type: String
    let Poster: String

    enum CodingKeys: String, CodingKey {
        case Title = "Title"
        case Year  = "Year"
        case _Type = "Type"
        case imdbID = "imdbID"
        case Poster = "Poster"
    }
}


//Models
// Enum can also be written as below
//struct Movie: Codable {
//    let Title: String
//    let Year: String
//    let imdbID: String
//    let _Type: String
//    let Poster: String
//
//    private enum CodingKeys: String, CodingKey {
//        case Title, Year, imdbID, _Type = "Type", Poster
//    }
//}
