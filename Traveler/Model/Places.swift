//
//  Places.swift
//  Traveler
//
//  Created by Mahbub  Ahmed on 7/22/20.
//  Copyright © 2020 Mahbub  Ahmed. All rights reserved.
//

import Foundation

struct Places: Decodable {
    let title: String
    let imageUrl: String
    let details: String
    
    // CodingKeys for JSON parsing
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case imageUrl = "image_url"
        case details = "details"
    }
}
