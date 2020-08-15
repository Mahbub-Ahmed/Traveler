//
//  EndPoint.swift
//
//  Created by Mahbub  Ahmed on 8/2/20.
//  Copyright © 2020 Mahbub  Ahmed. All rights reserved.

import Foundation

public protocol EndPoint {
    func urlRequest(query params: ((String) -> String)?) throws -> URLRequest
}


public struct ServiceEndPoint: EndPoint {
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
    
    public func urlRequest(query params: ((String) -> String)?) throws -> URLRequest {
        let items: [URLQueryItem]? = queryItems?.compactMap{ key in
            guard let params = params else { return nil }
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


public struct URLEndPoint: EndPoint {
    // URL String
    let urlString: String
    
    public init(urlString: String) {
        self.urlString = urlString
    }
    
    public func urlRequest(query params: ((String) -> String)? = nil) throws -> URLRequest {
        guard let url = URL(string: urlString) else {
            throw NetworkError.invalidURL
        }
        return URLRequest(url: url)
    }
}
