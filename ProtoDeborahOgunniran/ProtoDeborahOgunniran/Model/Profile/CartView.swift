//
//  CartView.swift
//  ProtoDeborahOgunniran
//
//  Created by Ogunniran Deborah on 25/02/2024.
//

import SwiftUI



struct CartView: View {
    @State var totalPrice = 0.00
    var body: some View {
        VStack {
            Text("My Cart")
                .font((.system(size: 44, weight: .semibold, design:  .rounded)))
                .frame(width: 32, alignment: .leading)
            List {
                ForEach(0..<cartItems.endIndex, id:\.self) {
                    item in
                    HStack {
                        Image(cartItems[item][0] as! String)
                            .resizable()
                            .frame(width: 40, height: 40)
                        VStack(spacing: 5) {
                            Text(cartItems[item][1] as! String)
                            Text("€\(String(format: "%.2f", cartItems[item][2] as! Double))")
                                .foregroundStyle(.gray)
                        }
                    }
                }.onDelete{indexSet in cartItems.remove(atOffsets: indexSet)
                    self.totalCalculator()
                    
                }
            }
            
            Spacer()
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(.green)
                    .opacity(0.8)
                    .frame(width: 350, height: 120)
                VStack {
                    Text("Total Price")
                        .foregroundColor(.white)
                        .font(.system(size: 20))
                        .frame(width: 350, alignment: .leading)
                        .padding(.leading, 60)
                    Text("€\(String(format: "%.2f", totalPrice))")
                        .foregroundColor(.white)
                        .font(.system(size: 25, weight: .bold))
                        .frame(width: 350, alignment: .leading)
                        .padding(.leading, 60)
                    
                }
                Button() {
                    
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 12)
                            .strokeBorder()
                            .frame(width: 120, height: 50)
                        Text("Pay Now >")
                            .foregroundColor(.white)
                            .bold()
                    }
                }.offset(x: 80)
            }
        }.onAppear(perform: self.totalCalculator)
    }
    func totalCalculator() {
        totalPrice = 0.00
        for i in 0..<cartItems.count {
            totalPrice += cartItems[i][2] as! Double
        }
    }
    
}
    
    #Preview {
        CartView()
    }

