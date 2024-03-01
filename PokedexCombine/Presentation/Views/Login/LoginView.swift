//
//  LoginView.swift
//  PokedexCombine
//
//  Created by Marcos on 27/2/24.
//

import SwiftUI

struct LoginView: View {
    
    @Binding var isLogged: Bool
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
                        .textInputAutocapitalization(.none)
                        .autocorrectionDisabled()
                        .padding(.horizontal, 30)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        

                    SecureField("Password", text: $password)
                        .padding(.horizontal, 30)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Spacer()
                    Button("Login") {
                        authViewModel.loginWithEmail(email: username, password: password) { logged in
                            isLogged = logged
                        }
                    }
                    NavigationLink {
                        SignUpView(isLogged: $isLogged)
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
    LoginView(isLogged: .constant(true))
}
