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
    @Binding var isAdded: Bool
    @Binding var isSubtracted: Bool
    @State var numOfItems: Int = 1
    
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
            VStack(spacing: 34) {
                HStack(alignment: .top) {
                    VStack(alignment: .leading) {
                        Text(title)
                            .font(.callout.bold())
                        Text(category)
                            .font(Font.caption.bold())
                    }
                    Spacer()
                    Button {
                        
                    } label: {
                        Image(systemName: "stroke.line.diagonal.slash")
                            .foregroundStyle(.gray)
                            .padding(6)
                            .background(
                                Circle().foregroundStyle(.gray).opacity(0.28)
                            )
                    }

                }
                HStack {
                    Text("$\(price, specifier: "%.2f")")
                    Spacer()
                    HStack(spacing: 14) {
                        Button {
                            isAdded = true
                            numOfItems =  numOfItems - 1
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
                        Text("\(numOfItems)")
                            .font(.title3.bold())
                        Button {
                            isSubtracted = true
                            numOfItems =  numOfItems + 1
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
            .frame(maxWidth: .infinity)
            .padding(.leading, -40)
            .padding(.trailing, 30)
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
    CartRowView(title: "Long full", image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_t.png", price: 9.009999, category: "T-shirt", isAdded: .constant(true), isSubtracted: .constant(true))
}
