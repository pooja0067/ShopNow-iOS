//
//  CustomPickerView.swift
//  ShopNow
//
//  Created by Pooja on 09/12/25.
//

import SwiftUI

struct CustomPickerView: View {
    var tabs = ["Login","Sign up"]
    var body: some View {
        HStack(spacing: 0) {
            ForEach(tabs, id: \.self) { tab in
                Button {
                    
                } label: {
                    Text(tab)
                        .font(.title2)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity)
                        .padding(8)
                        .foregroundStyle(.black)
                }
                .frame(height: 52)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray)
                        .fill(.white)
                )
            }
        }
        .background(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.gray, lineWidth: 1)
        )
    }
}

#Preview {
    CustomPickerView()
}
