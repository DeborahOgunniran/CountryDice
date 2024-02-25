//
//  PageView.swift
//  ProtoDeborahOgunniran
//
//  Created by Ogunniran Deborah on 22/02/2024.
//

import SwiftUI

struct PageView: View {
    var page: Page
    
    var body: some View {
        VStack(spacing: 20){
            Image("\(page.imageUrl)")
                .resizable()
                .scaledToFit()
                .padding()
                .cornerRadius(30)
                .background(.blue.opacity(0.15))
                .cornerRadius(10)
                .padding()
            
            Text(page.name)
                .font(.title)
            
            Text(page.description)
                .font(.subheadline)
                .frame(width:300)
        }
    }
}

#Preview {
    PageView(page:Page.samplePage)
}
