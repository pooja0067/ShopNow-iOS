//
//  CartTotalView.swift
//  ShopNow
//
//  Created by Pooja on 23/12/25.
//

import SwiftUI

struct CartTotalView: View {
    @Binding var totalAmount: Int
    private var subtotal: Double { Double(totalAmount) }
    private var tax: Double { subtotal * 10.0 / 100.0 }
    private var grandTotal: Double { subtotal + tax }
    @EnvironmentObject var navigator: NavigationManager
    
    private func money(_ value: Double) -> String {
        String(format: "%.2f", value)
    }
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading, spacing: 12) {
                    Text("Subtotal")
                        .font(.title3)
                    Text("Tax (1%)")
                        .font(.title3)
                }
                Spacer()
                VStack(alignment: .leading, spacing: 12) {
                    Text("$\(money(subtotal))")
                    Text("$\(money(tax))")
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
