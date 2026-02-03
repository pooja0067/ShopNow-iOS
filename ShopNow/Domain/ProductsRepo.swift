//
//  ProductsRepo.swift
//  ShopNow
//
//  Created by Pooja on 08/12/25.
//

import Foundation

class ProductsRepo {
    
    var productsData = ProductsDataSource()
    
    func getProducts(completion: @escaping (Result<[ProductsModel], Error>) -> Void) {
        productsData.fetchProduct { result in
            switch result {
            case .success(let model):
                completion(.success(model))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
