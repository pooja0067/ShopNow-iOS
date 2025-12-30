//
//  ProductsView.swift
//  ShopNow
//
//  Created by Pooja on 08/12/25.
//

import SwiftUI

struct ProductsView: View {
    @EnvironmentObject private var cart: CartStore
    @EnvironmentObject var navigator: NavigationManager
    @ObservedObject var viewModel: ProductsViewModel
    @State private var showAddedToast = false
    @State private var toastMessage = "Added to cart"
    
    var categoriesRepo = CategoriesRepo()
    var body: some View {
        let columns = [
            GridItem(.flexible(), spacing: 16),
            GridItem(.flexible(), spacing: 16)
        ]
        
        ScrollView(showsIndicators: false) {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(categoriesRepo.loadCategoriesFromFile()) { category in
                        Button {
                            navigator.path.append(Route.category)
                        } label: {
                            Text(category.name)
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
                .padding(.horizontal, 16)
            }
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(viewModel.products) { products in
                    CardView(
                        id: products.id,
                        title: products.title,
                        image: products.image,
                        price: products.price,
                        category: products.category,
                        action: {
                            let item = CartItem(
                                id: products.id,
                                title: products.title,
                                image: products.image,
                                price: products.price,
                                category: products.category,
                                qty: 1
                            )
                            cart.add(product: item)
                            toastMessage = "Added to cart"
                            withAnimation(.easeInOut(duration: 0.2)) {
                                showAddedToast = true
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
                                withAnimation(.easeInOut(duration: 0.2)) {
                                    showAddedToast = false
                                }
                            }
                        }
                    )
                }
            }
            .padding(.horizontal, 16)
            .padding(.top, 16)
        }
        .navigationTitle("Shop now")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    navigator.path.append(Route.cart)
                } label: {
                    Image(systemName: "cart")
                        .font(.title2)
                        .overlay(alignment: .topTrailing) {
                            Text("\(cart.totalCount > 9 ? "9+" : "\(cart.totalCount)")")
                                .font(.callout.bold())
                                .foregroundStyle(.white)
                                .background(
                                    Circle().fill(Color.red)
                                        .frame(width: 18, height: 18)
                                )
                                .offset(y: -2)
                        }
                }
            }
        }
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
