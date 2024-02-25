//
//  CountryView.swift
//  ProtoDeborahOgunniran
//
//  Created by Ogunniran Deborah on 24/02/2024.
// Shop

import SwiftUI

struct CountryView: View {
    
    var columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var items: [[Any]] = shopItems
    
    
    var body: some View {
        
        @State var goToCart = false
        
        
        VStack(spacing: 5) {
            VStack {
                Text("hey")
                    .frame(width: 320, alignment: .leading)
                    .foregroundColor(.gray)
                Text("Order fresh grocery \nfrom MyGrocery")
                    .font(.system(size: 35, weight: .semibold, design: .rounded))
                    .frame(width: 320, alignment: .leading)
                Spacer().frame(height: 75)
                Text("Fresh Items")
                    .frame(width: 320, alignment: .leading)
                    .foregroundColor(.gray)
                
            }.padding(20)
            ScrollView() {
                LazyVGrid(columns: columns, spacing: 30) {
                    ForEach(0..<items.count, id:\.self) { item in LikedView(imageName: items[item][0] as! String, title: items[item][1] as! String, price: items[item][2] as! Double, color: items[item][3] as! Color, selfIndex: item)
                       
                    }
                }
            }.padding(15)
        }
        
            .navigationDestination(isPresented: $goToCart) {
                CartView()
                }
        
            .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button() {
                            goToCart = true
                        }label: {
                            Image(systemName: "cart")
                        }
                    }
                }
        
    }
}

#Preview {
    CountryView()
}
