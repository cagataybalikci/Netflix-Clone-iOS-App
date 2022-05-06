//
//  YoutubeSearchResponse.swift
//  NetflixClone
//
//  Created by Çağatay Balıkçı on 6.05.2022.
//

import Foundation


struct YoutubeSearchResponse : Codable {
    let items : [VideoElement]
}



struct VideoElement : Codable {
    let id : IdVideoElement
}


struct IdVideoElement : Codable {
    let kind : String
    let videoId : String
}

