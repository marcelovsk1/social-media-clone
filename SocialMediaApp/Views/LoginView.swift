//
//  LoginView.swift
//  SocialMediaApp
//
//  Created by Marcelo Amaral Alves on 2023-10-20.
//

import SwiftUI

struct LoginView: View {
    
    @State private var isLoginMode = false
    @State private var email = ""
    @State private var password = ""
    @State private var image: UIImage?
    @State private var loginStatusMessage = ""
    @State private var shouldShowImagePicker = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.blue
                    .ignoresSafeArea()
                
                    Circle()
                    .scale(1.8)
                    .foregroundColor(.white)
                    .opacity(0.15)
                
                Circle()
                    .scale(1.4)
                    .foregroundColor(.white)
                
                VStack(spacing: 16) {
                    Text(isLoginMode ? "Login" : "Create Username")
                        .font(.largeTitle)
                        .bold()
                    
                    // Image picker if isLoginMode is false
                    
                    TextField("Email", text: $email)
                        .keyboardType(.emailAddress)
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                        .bold()
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                    
                    SecureField("Password", text: $password)
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                        .bold()
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                    
                    Button {
                        //
                    } label: {
                        Text(isLoginMode ? "Login" : "Create Account")
                            .foregroundColor(.white)
                            .padding(10)
                            .frame(width: 300, height: 50)
                            .background(.blue)
                            .cornerRadius(10)
                            .padding(.top, 20)
                    }
                    
                    HStack {
                        Text(isLoginMode ? "Don't have an account yet?" :
                        "Have an account?")
                        Button {
                            isLoginMode.toggle()
                        } label: {
                            Text(isLoginMode ? "Create Account" : "Login")
                        }
                    }
                    
                    Text(loginStatusMessage)
                        .foregroundColor(.red)
                    
                }
                .padding()
            }
            .fullScreenCover(isPresented: $shouldShowImagePicker) {
                ImagePicker(image: $image)
            }
        }
    }
}

#Preview {
    LoginView()
}
