//
//  ProductModel.swift
//  ios-architechtures
//
//  Created by Guilherme Gatto on 06/06/24.
//

import Foundation

struct ProductModel: Codable {
    let id: Int
    let title: String
    let price: Double
    let description: String
    let category: String
    let image: String
    let rating: ProductRatingModel
    
    struct ProductRatingModel: Codable {
        let rate: Double
        let count: Double
    }
}
