//
//  CouponView.swift
//  ShopNow
//
//  Created by Pooja on 05/01/26.
//

import SwiftUI


struct CouponView: View {
    
    var couponRepo = CouponRepo()
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(couponRepo.loadCouponFromFile()) { coupon in
                Button {
                    //navigator.path.append(Route.category)
                } label: {
                    Text("\(coupon.amount)")
                        .font(.callout).fontWeight(.bold)
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(
                            Capsule().fill(Color.orange)
                        )
                }
            }
        }
    }
}

