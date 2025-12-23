//
//  CartTotalView.swift
//  ShopNow
//
//  Created by Pooja on 23/12/25.
//

import SwiftUI

struct CartTotalView: View {
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading, spacing: 12) {
                    Text("SubTotal")
                        .font(.title3)
                    Text("Tax")
                        .font(.title3)
                }
                Spacer()
                VStack(alignment: .leading, spacing: 12) {
                    Text("$100.00")
                    Text("$10.00")
                }
            }
            Divider()
            HStack {
                Text("Total")
                    .font(.title.bold())
                Spacer()
                Text("$123.00")
            }
            Button {
                // checkout
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

#Preview {
    CartTotalView()
}
