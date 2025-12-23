//
//  CartRowView.swift
//  ShopNow
//
//  Created by Pooja on 23/12/25.
//

import SwiftUI

struct CartRowView: View {
    var title: String
    var image: String
    var price: Double
    var category: String
    
    var body: some View {
        HStack {
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
                        .frame(width: 120, height: 120)
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
            VStack(alignment: .leading, spacing: 24) {
                HStack {
                    VStack(alignment: .leading) {
                        Text(title)
                            .font(.callout.bold())
                        Text(category)
                            .font(Font.caption.bold())
                    }
                    Spacer()
                    Image(systemName: "stroke.line.diagonal.slash")
                        .foregroundStyle(.gray)
                        .padding(6)
                        .background(
                            Circle().foregroundStyle(.gray).opacity(0.28)
                        )
                }
                HStack {
                    Text("$\(price, specifier: "%.2f")")
                    Spacer()
                    HStack(spacing: 14) {
                        Button {
                            //
                        } label: {
                            Text("-")
                                .font(.title2.bold())
                                .foregroundStyle(.black)
                                .padding(2)
                                .frame(width: 30, height: 30)
                                .background(
                                    RoundedRectangle(cornerRadius: 4).foregroundStyle(.gray).opacity(0.28)
                                )
                        }
                        Text("1")
                        Button {
                            //
                        } label: {
                            Text("+")
                                .font(.title2.bold())
                                .padding(2)
                                .foregroundStyle(.black)
                                .frame(width: 30, height: 30)
                                .background(
                                    RoundedRectangle(cornerRadius: 4).foregroundStyle(.gray).opacity(0.28)
                                )
                        }

                    }
                }
            }
            .padding(.trailing, 16)
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
    CartRowView(title: "Long full", image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_t.png", price: 9.009999, category: "T-shirt")
    CartRowView(title: "Long full", image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_t.png", price: 9.009999, category: "T-shirt")
    CartRowView(title: "Long full", image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_t.png", price: 9.009999, category: "T-shirt")
}
