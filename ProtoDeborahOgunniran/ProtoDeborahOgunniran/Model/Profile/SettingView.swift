//
//  SettingView.swift
//  ProtoDeborahOgunniran
//
//  Created by Ogunniran Deborah on 23/02/2024.
//

import SwiftUI

struct SettingView: View {
    let imageName: String
    let title: String
    let tintColor: Color
    
    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: imageName)
                .imageScale(.small)
                .font(.title)
                .foregroundColor(tintColor)
            
            Text(title)
                .font(.subheadline)
                .foregroundColor(.black)
        }
    }
}

#Preview {
    SettingView(imageName: "list", title: "country", tintColor: .blue)
}
