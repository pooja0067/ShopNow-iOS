//
//  CartView.swift
//  ShopNow
//
//  Created by Pooja on 23/12/25.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject private var cart: CartStore
    @Environment(\.dismiss) private var dismiss
    @State var isAdded: Bool = false
    @State var isSubtracted: Bool = false
    @State var totalAmount: Double = 0.0
    
    var body: some View {
        NavigationStack {
            ScrollView {
                if cart.items.isEmpty {
                    VStack(spacing: 24) {
                        ContentUnavailableView("No items in cart", systemImage: "cart.fill")
                        Button {
                            dismiss()
                        } label: {
                            Text("Continue shopping")
                                .font(.title3)
                                .fontWeight(.bold)
                                .foregroundStyle(.white)
                                .padding(8)
                                .frame(maxWidth: .infinity)
                                .background(
                                    RoundedRectangle(cornerRadius: 8)
                                        .fill(.orange)
                                )
                        }
                        .frame(height: 60)
                        .padding()

                    }
                } else {
                    VStack {
                        ForEach(cart.items) { car in
                            CartRowView(title: car.title, image: car.image, price: car.price, category: car.category, isAdded: $isAdded, isSubtracted: $isSubtracted) {
                                cart.delete(productId: car.id)
                            }
                        }
                        Spacer()
                        CartTotalView(totalAmount: .constant(Int(cart.totalPrice)))
                    }
                    .navigationTitle("Shop now")
                    .navigationBarTitleDisplayMode(.inline)
                }
            }
        }
    }
}

