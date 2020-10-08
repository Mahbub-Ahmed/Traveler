//
//  UIImageExtension.swift
//  
//  Created by Mahbub  Ahmed on 8/15/20.
//  Copyright © 2020 Mahbub  Ahmed. All rights reserved.

import Foundation
import UIKit

public extension UIImage {
    static func from(urlString: String, shouldCache: Bool=false, completion: @escaping (Result<UIImage, NetworkError>) -> Void) {
        let imageCache = ImageCache()
        if shouldCache, let image = imageCache.cachedImage(for: urlString) {
            completion(.success(image))
            return
        }
        
        Data.from(endPoint: URLEndPoint(urlString: urlString), parse: { (data) -> UIImage? in
            guard let data = data, let image = UIImage(data: data) else { return nil }
            if shouldCache { imageCache.cache(image: image, for: urlString) }
            return image
        }, completion: completion)
    }
}
