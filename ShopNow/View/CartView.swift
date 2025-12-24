//
//  CartView.swift
//  ShopNow
//
//  Created by Pooja on 23/12/25.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject private var cart: CartStore
    @State var isAdded: Bool = false
    @State var isSubtracted: Bool = false
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    ForEach(cart.items) { car in
                        CartRowView(title: car.title, image: car.image, price: car.price, category: car.category, isAdded: $isAdded, isSubtracted: $isSubtracted)
                    }
                    Spacer()
                    CartTotalView()
                }
                .navigationTitle("Shop now")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}
