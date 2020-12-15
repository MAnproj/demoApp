//
//  demoModel.swift
//  demoApp
//
//  Created by abc on 15/12/20.
//  Copyright © 2020 abc. All rights reserved.
//

import Foundation

struct MostPopularResponse: Codable {
    let status:String
    let results:[Result]
}

struct Result: Codable {
    let title: String
    let byline: String
    let published_date: String
    let media: [Media]
}
struct Media: Codable {
    let copyright: String
    let mediaMetadata : [MediaMetadataDetails]
    
    enum CodingKeys: String, CodingKey {
       case mediaMetadata = "media-metadata"
       case copyright = "copyright"
    }
}

struct MediaMetadataDetails: Codable {
    let format: String
    let url: String
    
}
