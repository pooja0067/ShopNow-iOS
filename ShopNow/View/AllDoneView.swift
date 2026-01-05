//
//  AllDoneView.swift
//  ShopNow
//
//  Created by Pooja on 26/12/25.
//

import SwiftUI

struct AllDoneView: View {
    
    @EnvironmentObject private var cart: CartStore
    @State private var isAnimating: Bool = false
    @EnvironmentObject var navigator: NavigationManager
    
    var body: some View {
        VStack {
            Image(systemName: "checkmark.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 120)
                .foregroundStyle(Color.green)
                .padding()
                .scaleEffect(isAnimating ? 1.0 : 0.0)
                .rotationEffect(.degrees(isAnimating ? 0 : -15))
            Text("All done!")
                .font(.largeTitle.bold())
            Spacer()
            Button {
                cart.clear()
                navigator.path.removeLast(3)
            } label: {
                Text("Continue")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                    .padding(8)
                    .frame(maxWidth: .infinity)
                    .frame(height: 52)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(.orange)
                    )
            }
            .padding()
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    cart.clear()
                    navigator.path.removeLast(3)
                } label: {
                    Image(systemName: "xmark")
                        .font(.title3)
                }
            }
        }
        .onAppear {
            withAnimation(.easeInOut(duration: 1)) {
                isAnimating = true
            }
        }
    }
}

#Preview {
    AllDoneView()
}
