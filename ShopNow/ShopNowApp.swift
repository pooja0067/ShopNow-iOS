//
//  ShopNowApp.swift
//  ShopNow
//
//  Created by Pooja on 08/12/25.
//

import SwiftUI

@main
struct ShopNowApp: App {
    // Persisted first-launch flag using SwiftUI's AppStorage wrapper
    @StateObject private var cartStore = CartStore()
    @StateObject private var navigator = NavigationManager()
    @AppStorage("hasLaunchedBefore") private var hasLaunchedBefore: Bool = false
    @State var emailField: String = ""
    @State var pwdField: String = ""
    @State var tab: String = "Login"
    var body: some Scene {
        WindowGroup {
            Group {
                if !hasLaunchedBefore {
                    LoginView(emailField: $emailField, pwdField: $pwdField, tab: $tab)
                } else {
                    ContentView()
                }
            }
            .environmentObject(cartStore)
            .environmentObject(navigator)
        }
    }
}
