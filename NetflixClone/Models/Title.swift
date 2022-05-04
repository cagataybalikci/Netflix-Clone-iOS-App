//
//  Movie.swift
//  NetflixClone
//
//  Created by Çağatay Balıkçı on 4.05.2022.
//

import Foundation


struct TrendingTitleResponse : Codable {
    let results : [Title]
}

struct Title : Codable {
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


/*
 id = 110309;
 "media_type" = tv;
 name = "SK8 the Infinity";
 "origin_country" =             (
     JP
 );
 "original_language" = ja;
 "original_name" = "SK\U221e \U30a8\U30b9\U30b1\U30fc\U30a8\U30a4\U30c8";
 overview = "\"S\" is a dangerous, top secret, no-holds-barred downhill skateboarding race down an abandoned mine. When avid skateboarder Reki takes Langa to the mountain where \"S\" is held, Langa, who's never been on a skateboard in his life, finds himself sucked into the world of \"S\", and\U2026?!";
 popularity = "41.379";
 "poster_path" = "/ksb6QlSCsRLr3MNmxc8ojOOLK6V.jpg";
 "vote_average" = "8.9";
 "vote_count" = 207;
},
 
 */
