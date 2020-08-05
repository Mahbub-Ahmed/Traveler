//
//  EndPoint.swift
//  Traveler
//
//  Created by Mahbub  Ahmed on 8/2/20.
//  Copyright © 2020 Mahbub  Ahmed. All rights reserved.
//

import Foundation

struct EndPoint {
    // http or https
    let scheme: String
    
    // Ex: "github.com"
    let baseURL: String
    
    // Ex: "service/data"
    let path: String
    
    // query items
    let queryItems: [String]?
    
    // GET, POST ....
    let method: String
}


extension EndPoint {
    func urlRequest(query params: ((String) -> String)? = nil) throws -> URLRequest {
        let items: [URLQueryItem]? = queryItems?.compactMap{ key in
            guard let params = params { return nil }
            return URLQueryItem(name: key, value: params(key))
        }
        
        var components = URLComponents()
        components.scheme = scheme
        components.host = baseURL
        components.path = path
        components.queryItems = items
        
        guard let url = components.url else {
            throw NetworkError.invalidURL
        }
        return URLRequest(url: url)
    }
}
