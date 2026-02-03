//
//  ProductsViewModel.swift
//  ShopNow
//
//  Created by Pooja on 08/12/25.
//

import SwiftUI
import Combine
import Foundation

@MainActor
class ProductsViewModel: ObservableObject {
    @Published var products: [ProductsModel] = []
    init () {
        loadProducts()
    }
    
    func loadProducts() {
        ProductsRepo().getProducts { result in
            switch result {
            case .success(let products):
                Task { @MainActor in
                    self.products = products
                }
            case .failure(let error):
                Task { @MainActor in
                    print(error)
                }
            }
        }
    }
}

