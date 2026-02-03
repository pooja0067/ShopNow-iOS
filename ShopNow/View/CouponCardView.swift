//
//  CouponCardView.swift
//  ShopNow
//
//  Created by Pooja on 05/01/26.
//

import SwiftUI

struct CouponCardView: View {
    @Binding var appliedCoupon: Bool
    @Binding var couponFieldText: String
    var couponRepo = CouponRepo()
    private var couponRules: [CouponModel] {
        couponRepo.loadCouponFromFile()
    }
    var body: some View {
        VStack(alignment: .leading) {
            VStack {
                HStack {
                    Text("Apply coupon")
                        .font(Font.subheadline.bold())
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
                    TextField("Enter coupon code", text: $couponFieldText)
                        .font(Font.caption2.bold())
                        .frame(maxWidth: .infinity)
                        .padding(8)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .fill(.white)
                                .border(Color(.orange).opacity(0.8), width: 1)
                        )
                    Button {
                        let enteredCode = couponFieldText.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
                        
                        let isValidCoupon = couponRules.contains { rule in
                            rule.coupon_code.trimmingCharacters(in: .whitespacesAndNewlines).lowercased() == enteredCode
                        }
                        
                        appliedCoupon = isValidCoupon
                    } label: {
                        Text("Apply")
                            .font(Font.callout.bold())
                            .foregroundStyle(.white)
                            .padding()
                    }
                    .disabled(couponFieldText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
                    .opacity(couponFieldText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ? 0.5 : 1.0)
                    .frame(height: 34)
                    .background(
                        RoundedRectangle(cornerRadius: 4)
                            .fill(.red)
                    )
                    
                }
                .padding(.horizontal)
                .padding(.bottom, 8)
            }
    
            if appliedCoupon {
                Text("Coupon applied successfully 🎉")
                    .font(.caption2.bold())
                    .foregroundStyle(.green)
                    .padding(.bottom)
                    .padding(.horizontal, 24)
            } else if !couponFieldText.isEmpty {
                Text("Invalid coupon code")
                    .font(.caption2)
                    .foregroundStyle(.red)
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
