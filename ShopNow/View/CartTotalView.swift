//
//  CartTotalView.swift
//  ShopNow
//
//  Created by Pooja on 23/12/25.
//

import SwiftUI

struct CartTotalView: View {
    let item: [CartItem]
    @Binding var totalAmount: Int
    private var tax: Double { subtotal * 10.0 / 100.0 }
    @EnvironmentObject var navigator: NavigationManager
    var discountRepo = TotalDiscountRepo()
    
    private func money(_ value: Double) -> String {
        String(format: "%.2f", value)
    }
    
    private var subtotal: Double {
        item.reduce(0) { $0 + (Double($1.qty) * $1.price) }
    }
    
    private var pricingRules: [String: PricingRule] {
        discountRepo.loadPricingRulesFromFile()
    }
    
    private var totalDiscount: Double {
        item.reduce(0) { total, cartItem in
            let itemSubtotal = Double(cartItem.qty) * cartItem.price
            let rule = pricingRules[cartItem.category] // match by category string
            let discountPercent = rule?.discount ?? 0
            return total + (itemSubtotal * discountPercent / 100)
        }
    }
    
    private var totalTax: Double {
        item.reduce(0) { total, cartItem in
            let itemSubtotal = Double(cartItem.qty) * cartItem.price
            let rule = pricingRules[cartItem.category]
            let discountPercent = rule?.discount ?? 0
            let taxPercent = rule?.tax ?? 0
            
            let discountedPrice = itemSubtotal - (itemSubtotal * discountPercent / 100)
            let taxAmount = discountedPrice * taxPercent / 100
            return total + taxAmount
        }
    }
    
    private var grandTotal: Double {
        subtotal - totalDiscount + totalTax
    }
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading, spacing: 12) {
                    Text("Subtotal")
                        .font(.title3)
                    Text("TotalDiscount")
                        .font(.title3)
                    Text("TotalTax")
                        .font(.title3)
                }
                Spacer()
                VStack(alignment: .leading, spacing: 12) {
                    Text("$\(money(subtotal))")
                    Text("$\(money(totalDiscount))")
                    Text("$\(money(totalTax))")
                }
            }
            Divider()
            HStack {
                Text("Total")
                    .font(.title.bold())
                Spacer()
                Text("$\(money(grandTotal))")
                    .font(.title3.bold())
            }
            Button {
                navigator.path.append(Route.payments)
            } label: {
                Text("Checkout ")
                    .font(.title3)
                    .fontWeight(.bold)
                    .frame(height: 40)
                    .foregroundStyle(.white)
                    .padding(8)
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(.orange)
                    )
            }

        }
        .frame(maxWidth: .infinity)
        .padding()
    }
}
