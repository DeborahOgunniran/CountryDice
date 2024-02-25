//
//  PView.swift
//  ProtoDeborahOgunniran
//
//  Created by Ogunniran Deborah on 23/02/2024.
//

import SwiftUI

struct PView: View {
    @EnvironmentObject var viewModel: AuthModel
    var body: some View {
        if let user = viewModel.currentUser {
            List {
                Section {
                    HStack {
                        Text(user.initials)
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .background(Color(.systemBlue))
                            .frame(width: 70, height: 70)
                            .clipShape(Circle())
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text(user.fullname)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .padding(.top, 4)
                            
                            Text(user.email)
                                .font(.footnote)
                                .accentColor(.gray)
                        }
                    }
                    
                }
                
                Section(header: Text("Account")) {
                                Button(action: {
                                    viewModel.signOut()
                                }) {
                                    SettingView(imageName: "arrow.left.circle.fill", title: "Sign Out", tintColor: .red)
                                }
                                
                                Button(action: {
                                    print("Delete account..")
                                }) {
                                    SettingView(imageName: "xmark.circle.fill", title: "Delete account", tintColor: .red)
                                }
                    
                }
            }
        }
    }
        }

#Preview {
    PView()
}
