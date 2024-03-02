//
//  LoinViewModel.swift
//  PokedexCombine
//
//  Created by Marcos on 27/2/24.
//

import Foundation
import FirebaseAuth

final class AuthViewModel: ObservableObject {
    
    let useCase: UseCaseAuthProtocol
    
    @Published var userSession: FirebaseAuth.User?
    @Published var didAuthenticateUser = false
    @Published var currentUser: User?
    
    @Published var customError: String = ""


    init(useCase: UseCaseAuthProtocol) {
        self.useCase = useCase
    }
    
    
    //If true its fine
    func checkEmail(email: String) -> Bool{
        if(email.isEmpty || !email.contains("@")){
            customError = "Formato de email incorrecto"
            return false
        }else{
          return true
        }
    }
    
    func checkPassword(password: String) -> Bool{
        if(password.count < 5){
            customError = "La contraseña debe contener almenos 5 caracteres"
            return false
        }else{
            return true
        }
    }
    
    func checkPasswordsAreEqual(firstPassword: String, secondPassword: String) -> Bool {
        if(firstPassword == secondPassword){
            return true
        }else{
            customError = "Las contraseñas no son iguales"
            return false
        }
    }
    
    func loginWithEmail(email: String, password: String) {
        if(checkEmail(email: email) && checkPassword(password: password)){
            useCase.loginWithEmail(email: email, password: password) { isLogged in
                self.didAuthenticateUser = true
            } onFailure: { error in
                print("ERROR: \(error)")
                self.customError = "Usuario o contraseña incorrector"
                self.didAuthenticateUser = false
            }
        }
        
    }
    
    func logOut() {
        useCase.logOut {
            self.didAuthenticateUser = false
        } onFailure: { error in
            // TODO: Add some logs to firebase
            self.didAuthenticateUser = false

        }
    }
    
    func signUpWithEmail(email: String, firstPassword: String, secondPassword: String){
        if(checkEmail(email: email) && checkPassword(password: firstPassword)){
            if(checkPasswordsAreEqual(firstPassword: firstPassword, secondPassword: secondPassword)){
                useCase.registerWithEmail(email: email, password: firstPassword) { user in
                    print(user)
                    self.didAuthenticateUser = true
                } onFailure: { error in
                    print("ERROR: \(error)")
                    self.customError = "Error al crear el usuario"
                }
            }
            
        }
        

    }
    
}
