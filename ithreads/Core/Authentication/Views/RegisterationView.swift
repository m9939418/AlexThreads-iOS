//
//  RegisterationView.swift
//  ithreads
//
//  Created by Alex YANG 楊明仁 on 2024/12/3.
//

import SwiftUI

struct RegisterationView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var fullname = ""
    @State private var username = ""
    
    var body: some View {
        VStack {
            
            Spacer()
            
            Image("threads-app-icon")
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 120)
                .padding()
            
            VStack {
                TextField("Enter your email", text: $email)
                    .autocapitalization(.none)
                    .modifier(ThreadsTextFieldModifier())
                
                SecureField("Enter your password", text: $password)
                    .modifier(ThreadsTextFieldModifier())
                
                TextField("Enter your full name", text: $fullname)
                    .modifier(ThreadsTextFieldModifier())
                
                TextField("Enter your username", text: $username)
                    .modifier(ThreadsTextFieldModifier())
            }
            
            Button {
                
            } label: {
                Text("Sign Up")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(width: 352, height: 44)
                    .background(.black)
                    .cornerRadius(8)
            }
            .padding(.vertical)
            
            Spacer()
            
            Divider()
            
            Button {
                
            } label: {
                HStack(spacing: 8) {
                    Text("Already have an account?")
                    Text("Sign In")
                        .fontWeight(.semibold)
                }
                .foregroundColor(.black)
                .font(.footnote)
            }
            .padding(.vertical, 16)
        }
    }
}

#Preview {
    RegisterationView()
}
