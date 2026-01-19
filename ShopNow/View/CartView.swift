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
    @EnvironmentObject var navigator: NavigationManager
    @State var appliedCoupon: Bool = false
    @State var couponFieldText: String = ""
    var body: some View {
        GeometryReader { geo in
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
                    // Make the empty state fill the viewport so it looks centered/balanced.
                    .frame(minHeight: geo.size.height)
                } else {
                    // ✅ Total view stays inside the scroll view, but we ensure the content fills the viewport.
                    VStack(spacing: 12) {
                        ForEach(cart.items) { car in
                            CartRowView(
                                item: car,
                                title: car.title,
                                image: car.image,
                                price: car.price,
                                category: car.category
                            ) {
                                cart.delete(productId: car.id)
                            }
                        }
                        
                        CouponCardView(appliedCoupon: $appliedCoupon, couponFieldText: $couponFieldText)

                        Spacer(minLength: 16)

                        CartTotalView(item: cart.items,
                                      totalAmount: .constant(Int(cart.totalPrice)))
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 12)
                    // This is the key: it forces the VStack to be at least as tall as the screen,
                    // so the Spacer can push the total view to the bottom when there are few items.
                    .frame(minHeight: geo.size.height, alignment: .top)
                    .navigationTitle("Shop now")
                    .navigationBarTitleDisplayMode(.inline)
                }
            }
            // Make the ScrollView take the full available height.
            .frame(width: geo.size.width, height: geo.size.height)
        }
    }
}
