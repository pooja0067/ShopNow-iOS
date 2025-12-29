//
//  NavigationManager.swift
//  ShopNow
//
//  Created by Pooja on 26/12/25.
//

import Foundation
import SwiftUI
import Combine

class NavigationManager: ObservableObject {
    @Published var path = NavigationPath()
}
