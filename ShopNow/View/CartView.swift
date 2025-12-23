//
//  CartView.swift
//  ShopNow
//
//  Created by Pooja on 23/12/25.
//

import SwiftUI

struct CartView: View {
    
    var body: some View {
        NavigationStack {
            VStack {
                CartRowView(title: "Long full", image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_t.png", price: 9.009999, category: "T-shirt")
                CartRowView(title: "Long full", image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_t.png", price: 9.009999, category: "T-shirt")
                CartRowView(title: "Long full", image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_t.png", price: 9.009999, category: "T-shirt")
                Spacer()
                CartTotalView()
            }
            .navigationTitle("Shop now")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    CartView()
}
