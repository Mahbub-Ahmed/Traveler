//
//  NetworkService.swift
//
//  Created by Mahbub  Ahmed on 7/26/20.
//  Copyright © 2020 Mahbub  Ahmed. All rights reserved.

import Foundation

public class NetworkService {
    private let session = URLSession(configuration: .default)
    
    public init() {
    }
    
    func request(endpoint: EndPoint, completion: @escaping ((Result<Data?, NetworkError>)->Void)) {
        do {
            let dataTask = try session.dataTask(with: endpoint.urlRequest(query: nil)) { data, response, error in
                
                guard error == nil else {
                    completion(.failure(.connectionError))
                    return
                }
                // TODO: httpError
                completion(.success(data))
            }
            dataTask.resume()
        } catch {
            completion(.failure(.connectionError))
        }
    }
    
    
    public func request<Model>(endPoint: EndPoint, parse: @escaping ((Data?) throws -> Model?), completion: @escaping (Result<Model, NetworkError>)-> Void) {
        request(endpoint: endPoint) { result in
            switch result {
            case .success(let data):
                do {
                    if let model = try parse(data) {
                        completion(.success(model))
                    }
                } catch let error {
                    completion(.failure(.parsingError(error)))
                }
            case .failure(let error):
                completion(.failure(.invalideResponse(error)))
            }
        }
    }
    
    
    public func request<Model: Decodable>(endPoint: EndPoint, completion: @escaping (Result<Model, NetworkError>)-> Void) {
        request(endPoint: endPoint, parse: { data -> Model? in
            guard let data = data else { return nil }
            return try JSONDecoder().decode(Model.self, from: data)
        },completion: completion)
    }
}
