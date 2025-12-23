//
//  ProductsView.swift
//  ShopNow
//
//  Created by Pooja on 08/12/25.
//

import SwiftUI

struct ProductsView: View {
    @ObservedObject var viewModel: ProductsViewModel
    var categoriesRepo = CategoriesRepo()
    var body: some View {
        let columns = [
            GridItem(.flexible(), spacing: 16),
            GridItem(.flexible(), spacing: 16)
        ]
        
        NavigationStack {
            Text("Shop now")
                .font(.custom("Arial Rounded MT Bold", size: 34).italic())
                .bold(true)
            ScrollView(showsIndicators: false) {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16) {
                        ForEach(categoriesRepo.loadCategoriesFromFile()) { category in
                            NavigationLink {
                                CategoryView()
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
                            category: products.category
                        )
                    }
                }
                .padding(.horizontal, 16)
                .padding(.top, 16)
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink {
                        CartView()
                    } label: {
                        Image(systemName: "cart")
                            .font(.title3)
                            .background(
                                Circle()
                                    .fill(Color.red)
                                    .frame(width: 12, height: 12)
                                    .offset(x: 12, y: -10)
                            )
                    }
                }
            }
        }
    }
}

#Preview {
    ProductsView(viewModel: ProductsViewModel())
}
