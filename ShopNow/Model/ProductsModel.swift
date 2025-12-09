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

struct CategoryModel: Codable, Identifiable, Hashable {
    let id: UUID = UUID()           // auto-generated, not decoded
    let name: String
    let image: String
    
    enum CodingKeys: String, CodingKey {
            case name, image      // decoder will decode only these keys
        }
}
