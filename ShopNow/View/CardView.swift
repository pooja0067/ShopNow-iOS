//
//  CardView.swift
//  ShopNow
//
//  Created by Pooja on 09/12/25.
//

import SwiftUI

struct CardView: View {
    
    var id: Int
    var title: String
    var image: String
    var price: Double
    var category: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {

            AsyncImage(url: URL(string: image)) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                        .frame(height: 180)
                        .frame(maxWidth: .infinity)
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                        .frame(maxWidth: .infinity)
                        .padding(20)
                        .clipped()
                case .failure:
                    Color.gray
                        .frame(height: 180)
                @unknown default:
                    EmptyView()
                }
            }

            VStack(alignment: .leading, spacing: 6) {
                Text(title)
                    .font(.callout)
                    .fontWeight(.bold)
                    .foregroundStyle(.black)
                
                Text("$\(String(format: "%.2f", price))")
                    .font(.caption)
                    .foregroundStyle(.black)

                Text(category)
                    .font(.caption2)
                    .foregroundStyle(.black)
                    .padding(.bottom, 12)

                Button {
                    // add to cart
                } label: {
                    Text("Add to cart")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                        .padding(8)
                        .frame(maxWidth: .infinity)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .fill(.orange)
                        )
                }
            }
            .padding([.horizontal, .bottom], 12)
        }
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(.white)
        )
        .shadow(color: Color.black.opacity(0.30), radius: 8, x: 0, y: 4)
    }
}

#Preview {
    CardView(id: 1, title: "Jacket", image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_t.png", price: 15.0, category: "Men's clothging")
}
