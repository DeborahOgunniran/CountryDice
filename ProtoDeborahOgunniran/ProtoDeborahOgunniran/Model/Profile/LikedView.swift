//
//  LikedView.swift
//  ProtoDeborahOgunniran
//
//  Created by Ogunniran Deborah on 24/02/2024.
//shop item

import SwiftUI

struct LikedView: View {
    
    var imageName: String
    var title: String
    var price: Double
    var color: Color
    var selfIndex: Int
    
    
    
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .foregroundColor(Color.green)
                .opacity(0.30)
                .frame(width: 170, height: 230)
            VStack {
                Image(imageName)
                    .resizable()
                    .frame(width: 80, height: 80)
                Text(title)
                
                Button() {
                    cartItems.append(shopItems[selfIndex])
                    
                } label: {
                    Text("£\(String(format: "%.2f", 4,00))")
                        .foregroundColor(.white)
                        .frame(width: 100, height: 40)
                        .background(Color.green)
                }
            }
        }
    }
}

#Preview {
    LikedView(imageName: "mango", title: "Mango", price: 4.00, color: Color.green, selfIndex: 0)
}
