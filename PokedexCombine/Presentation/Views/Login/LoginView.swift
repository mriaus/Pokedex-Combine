//
//  LoginView.swift
//  PokedexCombine
//
//  Created by Marcos on 27/2/24.
//

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject var authViewModel: AuthViewModel
    
    @State private var username: String = ""
    @State private var password: String = ""
    

    
    var body: some View {
        NavigationView {
            ZStack {
                Image("loginBG")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)

                VStack(spacing: 30) {
                    Spacer()
                    TextField("Username", text: $username)
                        .autocorrectionDisabled()
                        .padding(.horizontal, 30)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .textInputAutocapitalization(.never)

                        

                    SecureField("Password", text: $password)
                        .padding(.horizontal, 30)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Spacer()
                    Button("Login") {
                        authViewModel.loginWithEmail(email: username, password: password)
                    }
                    NavigationLink {
                        SignUpView()
                    } label: {
                        Text("¿No tienes cuenta?")
                    }

                    Spacer()
                    Spacer()
                    
                }
                .alert("Error de login", isPresented: Binding<Bool>(
                    get: { !authViewModel.customError.isEmpty },
                    set: { _ in }
                ), actions: {
                    Button("Cerrar"){
                        authViewModel.customError = ""
                    }
                },message: {
                    Text(authViewModel.customError)
                })
                .padding()
                
            }
        }
    }
    
}

#Preview {
    LoginView()
}
