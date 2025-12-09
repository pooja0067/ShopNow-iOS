//
//  ContentView.swift
//  ShopNow
//
//  Created by Pooja on 08/12/25.
//

import SwiftUI


struct ContentView: View {
    @State private var path = NavigationPath()
    @State private var isSelected: Bool = false
    @AppStorage("hasLaunchedBefore") private var hasLaunchedBefore: Bool = false
    @ObservedObject var viewModel: ProductsViewModel
    //var categoriesRepo = CategoriesRepo()
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                VStack {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(viewModel.products) { product in
                                Text(product.category)
                            }
                        }
                    }
                }
                NavigationLink(destination: CategoryView()) {
                    Text("hello")
                }
            }
        }
        .onAppear {
            hasLaunchedBefore = true
        }
        .navigationTitle("Shop now")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ContentView(viewModel: ProductsViewModel())
}
