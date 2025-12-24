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

extension ProductsModel {
    func toCartItem(quantity: Int = 1) -> CartItem {
        CartItem(
            id: id,
            title: title,
            image: image,
            price: price,
            category: category,
            qty: quantity
        )
    }
}

struct CategoryModel: Codable, Identifiable, Hashable {
    let id: UUID = UUID()           // auto-generated, not decoded
    let name: String
    let image: String
    
    enum CodingKeys: String, CodingKey {
            case name, image      // decoder will decode only these keys
        }
}

struct CartItem: Identifiable, Codable, Equatable {
    let id: Int            // product id
    let title: String
    let image: String
    let price: Double
    let category: String
    var qty: Int
}
