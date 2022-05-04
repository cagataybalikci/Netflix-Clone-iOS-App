//
//  TV.swift
//  NetflixClone
//
//  Created by Çağatay Balıkçı on 4.05.2022.
//

import Foundation

struct TrendingTvResponse : Codable {
    let results : [TV]
}


struct TV : Codable {
    let id: Int
    let media_type : String?
    let original_name: String?
    let original_title: String?
    let poster_path : String?
    let overview : String?
    let vote_count : Int
    let vote_average : Double?
    let release_date : String?
}
