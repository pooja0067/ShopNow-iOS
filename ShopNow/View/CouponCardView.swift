//
//  CouponCardView.swift
//  ShopNow
//
//  Created by Pooja on 05/01/26.
//

import SwiftUI

struct CouponCardView: View {
    @Binding var appliedCoupon: Bool
    var body: some View {
        VStack(alignment: .leading) {
            VStack {
                HStack {
                    Text("Apply coupon")
                        .font(Font.caption.bold())
                        .foregroundStyle(.red)
                    Spacer()
                    NavigationLink {
                        EmptyView()
                    } label: {
                        Text("View all")
                            .font(Font.caption.bold())
                            .foregroundStyle(.red)
                    }
                    
                }
                .padding(.top)
                .padding(.horizontal)
                HStack(spacing: 24) {
                    TextField("Enter coupon code", text: .constant(""))
                        .font(Font.caption2.bold())
                        .padding(8)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .fill(.white)
                                .border(Color(.orange).opacity(0.8), width: 1)
                        )
                    Spacer()
                    Button {
                        appliedCoupon = true
                    } label: {
                        Text("Apply")
                            .font(Font.callout.bold())
                            .foregroundStyle(.white)
                            .padding()
                    }
                    .background(
                        RoundedRectangle(cornerRadius: 4)
                            .fill(.red)
                    )
                    
                }
                .padding(.horizontal)
            }
            if appliedCoupon {
                Text("Saved amount 500")
                    .font(.caption2.bold())
                    .foregroundStyle(.green)
                    .padding(.bottom)
                    .padding(.horizontal, 24)
            }
        }
        .background(
            RoundedRectangle(cornerRadius: 8)
                .fill(Color(.white))
        )
        .shadow(color: Color.black.opacity(0.10), radius: 8, x: 0, y: 4)
        .padding()
    }
}
