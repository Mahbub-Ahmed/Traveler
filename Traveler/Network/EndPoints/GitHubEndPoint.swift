//
//  TravelerEndPoint.swift
//  Traveler
//
//  Created by Mahbub  Ahmed on 8/2/20.
//  Copyright © 2020 Mahbub  Ahmed. All rights reserved.
//

import Foundation

struct GitHubEndPoint {
    static let api = GitHubEndPoint()
    
    let traveler = EndPoint(scheme: "https",
                          baseURL: "github.com",
                          path: "/Mahbub-Ahmed/Data_Set/tree/master/TravelerData",
                          queryItems: nil,
                          method: "GET")
}
