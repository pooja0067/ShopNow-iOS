//
//  CartStore.swift
//  ShopNow
//
//  Created by Pooja on 23/12/25.
//

import Foundation
import SwiftUI
import Combine

@MainActor
final class CartStore: ObservableObject {

    @Published private(set) var items: [CartItem] = [] {
        didSet { save() }
    }

    private let key = "cart_items_v1"

    init() { load() }

    // MARK: - Actions

    func add(product: CartItem) {
        if let index = items.firstIndex(where: { $0.id == product.id }) {
            items[index].qty += 1
        } else {
            var p = product
            p.qty = max(1, p.qty)
            items.append(p)
        }
    }

    func decrease(productId: Int) {
        guard let index = items.firstIndex(where: { $0.id == productId }) else { return }
        items[index].qty -= 1
        if items[index].qty <= 0 {
            items.remove(at: index)
        }
    }

    func delete(productId: Int) {
        items.removeAll { $0.id == productId }
    }

    func clear() {
        items.removeAll()
    }

    var totalCount: Int { items.reduce(0) { $0 + $1.qty } }
    var totalPrice: Double { items.reduce(0) { $0 + (Double($1.qty) * $1.price) } }

    // MARK: - Persist

    private func save() {
        do {
            let data = try JSONEncoder().encode(items)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print("Cart save failed:", error)
        }
    }

    private func load() {
        guard let data = UserDefaults.standard.data(forKey: key) else { return }
        do {
            items = try JSONDecoder().decode([CartItem].self, from: data)
        } catch {
            print("Cart load failed:", error)
            items = []
        }
    }
}
