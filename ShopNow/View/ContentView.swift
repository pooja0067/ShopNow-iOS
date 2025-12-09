//
//  ContentView.swift
//  ShopNow
//
//  Created by Pooja on 08/12/25.
//

import SwiftUI


struct ContentView: View {
    @State private var path = NavigationPath()
    @AppStorage("hasLaunchedBefore") private var hasLaunchedBefore: Bool = false
    @ObservedObject var viewModel: ProductsViewModel
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                VStack {
                    ForEach(viewModel.products) { product in
                        Text(product.category)
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
}

#Preview {
    ContentView(viewModel: ProductsViewModel())
}
