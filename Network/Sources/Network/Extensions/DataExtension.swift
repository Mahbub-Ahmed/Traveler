//
//  DataExtension.swift
//
//  Created by Mahbub  Ahmed on 8/10/20.
//  Copyright © 2020 Mahbub  Ahmed. All rights reserved.

import Foundation

public extension Data {
    static func from<T>(endPoint: EndPoint, parse: @escaping ((Data?) throws -> T?), completion: @escaping (Result<T, NetworkError>) -> Void) {
        let service = NetworkService()
        service.request(endPoint: endPoint, parse: parse, completion: completion)
    }
}
