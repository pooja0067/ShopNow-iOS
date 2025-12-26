//
//  CartRowView.swift
//  ShopNow
//
//  Created by Pooja on 23/12/25.
//

import SwiftUI

struct CartRowView: View {
    let item: CartItem
    var title: String
    var image: String
    var price: Double
    var category: String
    let limitofItems = 5
    @EnvironmentObject private var cart: CartStore
    @State private var toastMessage = "5 items are availble"
    @State private var showAddedToast = false
    @State var numOfItems: Int = 1
    var closeAction: () -> Void
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
                       closeAction()
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
                            if numOfItems != 0 {
                                numOfItems =  numOfItems - 1
                                cart.decrease(productId: item.id)
                            }
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
                            if !(numOfItems == limitofItems) {
                                numOfItems =  numOfItems + 1
                                cart.add(product: item)
                            } else {
                                toastMessage = "Maximum limit reached"
                                withAnimation(.easeInOut(duration: 0.2)) {
                                    showAddedToast = true
                                }
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
                                    withAnimation(.easeInOut(duration: 0.2)) {
                                        showAddedToast = false
                                    }
                                }
                            }
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
        .overlay(alignment: .bottom) {
            if showAddedToast {
                Text(toastMessage)
                    .font(.callout)
                    .foregroundStyle(.white)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 10)
                    .background(
                        Capsule().fill(Color.black.opacity(0.85))
                    )
                    .padding(.bottom, 24)
                    .transition(.move(edge: .bottom).combined(with: .opacity))
            }
        }
    }
}
