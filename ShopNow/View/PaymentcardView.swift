//
//  PaymentcardView.swift
//  ShopNow
//
//  Created by Pooja on 26/12/25.
//

import SwiftUI

struct PaymentcardView: View {
    var title: String
    var image: String
    
    var body: some View {
        HStack {
            Image(systemName: image)
                .font(.system(size: 40, weight: .bold, design: .default))
                .foregroundColor(.black)
                .padding(16)
            Spacer()
            Text(title)
                .font(.title)
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.white.opacity(0.95))
                .padding()
        )
        .shadow(color: Color.black.opacity(0.30), radius: 8, x: 0, y: 4)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    PaymentcardView(title: "Payment card", image: "creditcard.and.numbers")
    PaymentcardView(title: "Payment card", image: "creditcard.and.numbers")
    PaymentcardView(title: "Payment card", image: "creditcard.and.numbers")
}
