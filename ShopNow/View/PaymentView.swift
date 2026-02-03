//
//  PaymentView.swift
//  ShopNow
//
//  Created by Pooja on 26/12/25.
//

import SwiftUI

struct PaymentView: View {
    @State private var selectedOptionId: String = ""
    @EnvironmentObject var navigator: NavigationManager
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Select Payment Method")
                .font(Font.title2.bold())
                .padding(.bottom, 8)
                .padding(.horizontal, 16)
            Text("Choose a payment option to complete your purchase")
                .font(Font.title3)
                .padding(.horizontal, 16)
            PaymentcardView(title: "Payment card", image: "creditcard.rewards.fill", optionId: "1", selectedOptionId: $selectedOptionId)
            PaymentcardView(title: "Phone Pay", image: "creditcard.rewards.fill", optionId: "2", selectedOptionId: $selectedOptionId)
            PaymentcardView(title: "COD", image: "creditcard.rewards.fill", optionId: "3", selectedOptionId: $selectedOptionId)
            
            Spacer()
            Button {
                navigator.path.append(Route.allDone)
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
        .navigationTitle("Shop now")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    PaymentView()
}
