//
//  NavigationManager.swift
//  ShopNow
//
//  Created by Pooja on 26/12/25.
//

import Foundation
import SwiftUI
import Combine

final class NavigationManager: ObservableObject {
    @Published var path = NavigationPath()
}

enum Route: Hashable {
    case cart
    case category
    case payments
    case allDone
}
