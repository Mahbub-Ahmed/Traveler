//
//  ImageCache.swift
//  
//  Created by Mahbub  Ahmed on 8/17/20.
//  Copyright © 2020 Mahbub  Ahmed. All rights reserved.

import Foundation
import UIKit

class ImageCache: Cache {
    func cache(image: UIImage, for key: String) {
        appCache.setObject(image, forKey: key as NSString)
    }
    
    func cachedImage(for key: String) -> UIImage? {
        return appCache.object(forKey: key as NSString) as? UIImage
    }
}
