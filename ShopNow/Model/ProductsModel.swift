//
//  ProductsModel.swift
//  ShopNow
//
//  Created by Pooja on 08/12/25.
//

import Foundation

struct ProductsModel: Codable, Identifiable {
    let id: Int
    let title: String
    let price: Double
    let description: String
    let category: String
    let image: String
    let rating: RatingModel
}

struct RatingModel: Codable {
    let rate: Double
    let count: Int
}
