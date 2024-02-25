//
//  InputView.swift
//  ProtoDeborahOgunniran
//
//  Created by Ogunniran Deborah on 23/02/2024.
//

import SwiftUI

struct InputView: View {
    @Binding var text: String
    let title: String
    let placeholder: String
    var isSecuredField = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
           // /*@START_MENU_TOKEN@*/Text("Placeholder")/*@END_MENU_TOKEN@*/
       
            Text(title)
                .foregroundColor(Color(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/))
                .fontWeight(.semibold)
                .font(.footnote)
            
            if isSecuredField{
                SecureField(placeholder, text: $text)
                    .font(.system(size: 15))
                
            } else{
                TextField(placeholder, text: $text)
                    .font(.system(size: 15))
            }
            
            Divider()
        }
    }
}

#Preview {
    InputView(text: .constant(""), title: "Email", placeholder: "name@example.com")
}
