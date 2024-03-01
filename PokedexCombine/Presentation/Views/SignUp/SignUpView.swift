//
//  SignUp.swift
//  PokedexCombine
//
//  Created by Marcos on 1/3/24.
//

import SwiftUI
struct SignUpView: View {
    
    @EnvironmentObject var authViewModel: AuthViewModel
    @Environment(\.presentationMode) var presentationMode
    @Binding var isLogged: Bool

    
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var repeatedPassword: String = ""
    

    
    var body: some View {
            ZStack {
                Image("loginBG")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)

                VStack(spacing: 30) {
                    Spacer()
                    TextField("Username", text: $username)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                        .padding(.horizontal, 30)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        

                    SecureField("Password", text: $password)
                        .padding(.horizontal, 30)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    SecureField("Repeat Password", text: $repeatedPassword)
                        .padding(.horizontal, 30)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Spacer()
                    Button("Registrarse") {
                        authViewModel.signUpWithEmail(email: username, firstPassword: password, secondPassword: repeatedPassword) { bool in
                            isLogged = bool
                        }
                    }
                    Button("Ya tengo cuenta") {
                        presentationMode.wrappedValue.dismiss()
                    }
                    
                    Spacer()
                    Spacer()
                }
                .alert("Error de creación de usuario", isPresented: Binding<Bool>(
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
                .navigationBarHidden(true)
            
        }
    }
    
}
