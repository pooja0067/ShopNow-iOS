//
//  ContentView.swift
//  ShopNow
//
//  Created by Pooja on 08/12/25.
//

import SwiftUI


struct ContentView: View {
    @EnvironmentObject var navigator: NavigationManager
    @StateObject private var viewModel = ProductsViewModel()
    
    var body: some View {
        NavigationStack(path: $navigator.path) {
            ProductsView(viewModel: viewModel)
                .navigationTitle("Shop now")
                .navigationBarTitleDisplayMode(.inline)
                .navigationDestination(for: Route.self) { route in
                    switch route {
                    case .cart:
                        CartView()
                    case .category:
                        CategoryView()
                    case .payments:
                        PaymentView()
                    case .allDone:
                        AllDoneView()
                    }
                }
        }
    }
}
