//
//  ImageDownloader.swift
//  ios-architechtures
//
//  Created by Guilherme Gatto on 07/06/24.
//

import UIKit

class ImageDownloader {
    
    
    static func download(from url: URL, completion: @escaping (UIImage?) -> Void) {
        if let cachedImage = ImageCache.get(for: url) {
            completion(cachedImage)
            return
        }
    
        let queue = DispatchQueue(label: "download.product.image")
        queue.async {
            let data = try? Data(contentsOf: url)
            guard let data = data else {
                completion(nil)
                return
            }
            guard let image = UIImage(data: data) else {
                completion(nil)
                return
            }
            
            ImageCache.set(for: url, image: image)
            completion(image)
        }    
    }
    
}
