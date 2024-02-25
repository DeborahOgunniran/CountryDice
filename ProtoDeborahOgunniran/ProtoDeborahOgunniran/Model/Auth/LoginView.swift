//
//  LoginView.swift
//  ProtoDeborahOgunniran
//
//  Created by Ogunniran Deborah on 23/02/2024.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewModel: AuthModel
    
    
    var body: some View {
        NavigationStack{
            VStack{
                // img
                Image("plane")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 130)
                    .padding(40)
                
                
                // form
                VStack(spacing: 25) {
                    InputView(text: $email,
                              title: "Email",
                              placeholder: "name@example.com")
                    .autocapitalization(.none)
                    
                    InputView(text: $password,
                              title: "Password",
                              placeholder: "Enter Your password",
                              isSecuredField: true)
                }
                .padding(.horizontal)
                .padding(.top, 10)
                
                // sign in btn
                Button {
                    Task {
                        try await viewModel.signIn(withEmail: email, password: password)
                    }
                    
                } label: {
                    HStack{
                        Text("SIGN IN")
                            .fontWeight(.semibold)
                        Image(systemName: "arrow.right")
                    }
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width - 32, height: 48)
                }
                .background(Color(.systemBlue))
                .disabled(formIsValid)
                .opacity(formIsValid ? 1.0 : 0.5)
                .cornerRadius(12)
                .padding(.top, 24)
                
                Spacer()
                
                
                // sign up btn
                
                NavigationLink {
                    SignUpView()
                        //.navigationBarBackButtonHidden(true)
                    
                } label: {
                    HStack(spacing: 3) {
                        Text("New user?")
                        Text("Sign up")
                            .fontWeight(.bold)
                        
                    }
                    .font(.system(size: 15))
                }
            }
        }
    }
}

// auth protocol

extension LoginView: AuthFormProtocol {
    
    var formIsValid: Bool {
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && password.count > 5
    
    }
}

#Preview {
    LoginView()
}
