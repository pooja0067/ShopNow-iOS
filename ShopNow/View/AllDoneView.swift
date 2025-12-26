//
//  AllDoneView.swift
//  ShopNow
//
//  Created by Pooja on 26/12/25.
//

import SwiftUI

struct AllDoneView: View {
    var body: some View {
        VStack {
            Image(systemName: "checkmark.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 120)
                .foregroundStyle(Color.green)
                .padding()
            Text("All done!")
                .font(.largeTitle.bold())
            Spacer()
            Button {
                //
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
    }
}

#Preview {
    AllDoneView()
}
