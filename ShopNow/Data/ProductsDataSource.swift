//
//  File.swift
//  ShopNow
//
//  Created by Pooja on 08/12/25.
//

import Foundation

//MARK: - Data source for products
class ProductsDataSource {
    private let baseURL = URL(string: "https://fakestoreapi.com/products")!
    
    func fetchProduct(completion: @escaping (Result<[ProductsModel], Error>) -> Void) {
        URLSession.shared.dataTask(with: baseURL) { data, response, error in
            
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else { return }
            
            do {
                let product = try JSONDecoder().decode([ProductsModel].self, from: data)
                completion(.success(product))
            } catch {
                completion(.failure(error))
            }
            
        }.resume()
    }
}

//MARK: - Data source for category
class CategoriesRepo {
    
    func loadCategoriesFromFile() -> [CategoryModel] {
        guard let url = Bundle.main.url(forResource: "categories", withExtension: "json"),
              let data = try? Data(contentsOf: url) else {
            return []
        }
        do {
            let categories = try JSONDecoder().decode([CategoryModel].self, from: data)
            return categories
        } catch {
            print("Error decoding: \(error)")
            return []
        }
    }
}


//MARK: - Data source tax and discount

final class TotalDiscountRepo {
    func loadPricingRulesFromFile() -> [String: PricingRule] {
        guard let url = Bundle.main.url(forResource: "discount", withExtension: "json"),
              let data = try? Data(contentsOf: url) else {
            return [:]
        }

        do {
            return try JSONDecoder().decode([String: PricingRule].self, from: data)
        } catch {
            print("Error decoding pricing rules:", error)
            return [:]
        }
    }
}

//MARK: - Data source coupon

final class CouponRepo {
    func loadCouponFromFile() -> [CouponModel] {
        guard let url = Bundle.main.url(forResource: "coupon", withExtension: "json"),
              let data = try? Data(contentsOf: url) else {
            return []
        }

        do {
            return try JSONDecoder().decode([CouponModel].self, from: data)
        } catch {
            print("Error decoding pricing rules:", error)
            return []
        }
    }
}


