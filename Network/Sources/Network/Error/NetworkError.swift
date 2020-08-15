//
//  NetworkError.swift
//
//  Created by Mahbub  Ahmed on 7/26/20.
//  Copyright © 2020 Mahbub  Ahmed. All rights reserved.

import Foundation

/*
 - Network service error
 */
public enum NetworkError: Error {
    case invalidURL
    case invalideResponse(_ error: Error)
    case connectionError
    case parsingError(_ error: Error)
    case httpError(_ code: Int)
}
