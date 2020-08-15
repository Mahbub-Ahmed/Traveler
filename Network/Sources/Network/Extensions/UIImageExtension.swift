//
//  UIImageExtension.swift
//  
//  Created by Mahbub  Ahmed on 8/15/20.
//  Copyright © 2020 Mahbub  Ahmed. All rights reserved.

import Foundation
import UIKit

public extension UIImage {
    static func from(urlString: String, completion: @escaping (Result<UIImage, NetworkError>) -> Void) {
        let imageEnd = URLEndPoint(urlString: urlString)
        
        Data.from(endPoint: imageEnd, parse: { (data) -> UIImage? in
            guard let data = data else { return nil }
            return UIImage(data: data)
        }, completion: completion)
    }
}
