//
//  Cache.swift
//
//  Created by Mahbub  Ahmed on 8/17/20.
//  Copyright © 2020 Mahbub  Ahmed. All rights reserved.

import Foundation

fileprivate let cache = NSCache<AnyObject, AnyObject>()

protocol Cache {
    var appCache: NSCache<AnyObject, AnyObject> { get }
    
}

extension Cache {
    var appCache: NSCache<AnyObject, AnyObject> { cache }
}
