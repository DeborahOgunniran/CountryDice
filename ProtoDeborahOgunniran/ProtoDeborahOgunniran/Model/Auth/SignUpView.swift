//
//  SignUpView.swift
//  ProtoDeborahOgunniran
//
//  Created by Ogunniran Deborah on 23/02/2024.
//

import SwiftUI

struct SignUpView: View {
    @State private var email = ""
    @State private var fullname = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: AuthModel
    
    var body: some View {
        VStack {
            
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
                
                InputView(text: $fullname,
                          title: "Full Name",
                          placeholder: "Name Surname")
                
                
                InputView(text: $password,
                          title: "Password",
                          placeholder: "Enter Your password",
                          isSecuredField: true)
                
                ZStack(alignment: .trailing) {
                    InputView(text: $confirmPassword,
                              title: "Confirm Password",
                              placeholder: "Confirm Your password",
                              isSecuredField: true)
                    
                    if !password.isEmpty && confirmPassword.isEmpty{
                        if password == confirmPassword {
                            Image(systemName: "checkmark.circle.fill")
                            
                                .imageScale(.large)
                                .fontWeight(.bold)
                                .foregroundColor(Color(.systemGreen))
                        } else{
                            Image(systemName: "xmark.circle.fill")
                            
                                .imageScale(.large)
                                .fontWeight(.bold)
                                .foregroundColor(Color(.systemRed))
                        }
                    }
                }
            }
            .padding(.horizontal)
            .padding(.top, 10)
            
            Button {
                Task {
                    try await viewModel.createUser(withEmail: email, password: password, fullname: fullname)
                }
            } label: {
                HStack{
                    Text("SIGN UP")
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
            
            Button {
                dismiss()
            } label: {
                HStack(spacing: 3) {
                    Text("Have an account?")
                    Text("Sign in")
                        .fontWeight(.bold)
                    
                }
                .font(.system(size: 15))
            }
            
        }
    }
}


// auth protocol

extension SignUpView: AuthFormProtocol {
    
    var formIsValid: Bool {
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && password.count > 5        
        && confirmPassword == password
        && fullname.isEmpty
    
    }
}

#Preview {
    SignUpView()
}
