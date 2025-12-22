//
//  CategoryView.swift
//  ShopNow
//
//  Created by Pooja on 09/12/25.
//

import SwiftUI

struct CategoryView: View {
    var categoriesRepo = CategoriesRepo()
    var body: some View {
        let columns = [
            GridItem(.flexible(), spacing: 16),
            GridItem(.flexible(), spacing: 16)
        ]
        ScrollView {
            Text("Categories")
                .font(.largeTitle).bold()
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 16)
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(categoriesRepo.loadCategoriesFromFile()) { category in
                    VStack {
                        NavigationLink {
                            ProductsView(viewModel: ProductsViewModel())
                        } label: {
                            if let url = URL(string: category.image) {
                                AsyncImage(url: url) { phase in
                                    switch phase {
                                    case .empty:
                                        ProgressView()
                                            .frame(height: 250)
                                        
                                    case .success(let image):
                                        image
                                            .resizable()
                                            .scaledToFit()
                                            .clipped()
                                            .padding(16)
                                            .background(
                                                RoundedRectangle(cornerRadius: 8)
                                                    .fill(.gray)
                                            )
                                        
                                    case .failure:
                                        Image(systemName: "photo")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(height: 250)
                                            .foregroundColor(.gray)
                                    @unknown default:
                                        EmptyView()
                                    }
                                }
                            }
                        }
                        .overlay(alignment: .bottom) {
                            Text(category.name)
                                .font(.title).bold()
                                .foregroundStyle(.white)
                                .padding(.bottom, 16)
                                .padding(.horizontal, 8)
                        }
                    }
                }
            }
            .padding(16)
        }
    }
}

#Preview {
    CategoryView()
}
