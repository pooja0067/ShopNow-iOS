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

    /// Unique identifier for this payment option
    var optionId: String

    /// Selected payment option id in parent
    @Binding var selectedOptionId: String

    private var isOnBinding: Binding<Bool> {
        Binding(
            get: { selectedOptionId == optionId },
            set: { newValue in
                if newValue {
                    selectedOptionId = optionId
                } else if selectedOptionId == optionId {
                    selectedOptionId = ""
                }
            }
        )
    }
    
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
            Toggle("", isOn: isOnBinding)
                .labelsHidden()
                .padding()
        }
        .frame(maxWidth: .infinity)
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.white.opacity(0.95))
                .padding()
        )
        .shadow(color: Color.black.opacity(0.30), radius: 8, x: 0, y: 4)
    }
}
