//
//  PaymentView.swift
//  ShopNow
//
//  Created by Pooja on 26/12/25.
//

import SwiftUI

struct PaymentView: View {
    var body: some View {
        VStack {
            Text("Modes of payment")
                .font(Font.largeTitle.bold())
                .padding()
            NavigationLink {
                AllDoneView()
            } label: {
                VStack {
                    PaymentcardView(title: "Payment card", image: "creditcard.rewards.fill")
                    PaymentcardView(title: "Phone Pay", image: "creditcard.rewards.fill")
                    PaymentcardView(title: "COD", image: "creditcard.rewards.fill")
                }
            }
        }
    }
}

#Preview {
    PaymentView()
}
