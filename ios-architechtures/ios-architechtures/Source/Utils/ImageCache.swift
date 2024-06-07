//
//  ImageCache.swift
//  ios-architechtures
//
//  Created by Guilherme Gatto on 07/06/24.
//

import UIKit

class ImageCache {
    static private let imageCache = NSCache<AnyObject, AnyObject>()

    static func get(for url: URL) -> UIImage? {
        return imageCache.object(forKey: url as AnyObject) as? UIImage
    }
    
    static func set(for url: URL, image: UIImage) {
        imageCache.setObject(image as AnyObject, forKey: url as AnyObject)
    }
}
