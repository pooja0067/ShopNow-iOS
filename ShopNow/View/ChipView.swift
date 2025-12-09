//
//  ChipView.swift
//  ShopNow
//
//  Created by Pooja on 09/12/25.
//

import SwiftUI

struct ChipView: View {
    let title: String
    @Binding var isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button {
            action()
        } label: {
            Text(title)
                .font(.system(size: 14, weight: .medium))
                .fontWeight(.bold)
                .foregroundColor(isSelected ? .white : .black)
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .background(
                    Capsule()
                        .fill(isSelected ? Color.orange : Color(.systemGray5))
                )
        }

    }
}

#Preview {
    ChipView(title: "Men", isSelected: .constant(false)) {
        print("hello")
    }
}
