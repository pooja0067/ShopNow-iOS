//
//  PaymentView.swift
//  ShopNow
//
//  Created by Pooja on 26/12/25.
//

import SwiftUI

struct PaymentView: View {
    @State private var selectedOptionId: String = ""
    var body: some View {
        VStack {
            Text("Payment")
                .font(Font.title.bold())
                .padding()
            Text("How would you like to pay?")
                .font(Font.title3.bold())
                .padding()
            PaymentcardView(title: "Payment card", image: "creditcard.rewards.fill", optionId: "1", selectedOptionId: $selectedOptionId)
            PaymentcardView(title: "Phone Pay", image: "creditcard.rewards.fill", optionId: "2", selectedOptionId: $selectedOptionId)
            PaymentcardView(title: "COD", image: "creditcard.rewards.fill", optionId: "3", selectedOptionId: $selectedOptionId)
            
            Spacer()
            NavigationLink {
                AllDoneView()
            } label: {
                Text("Continue")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                    .padding(8)
                    .frame(maxWidth: .infinity)
                    .frame(height: 52)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(.orange)
                    )
            }
            .padding()
        }
    }
}

#Preview {
    PaymentView()
}
