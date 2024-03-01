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
    
    func loginWithEmail(email: String, password: String, completion: @escaping (Bool) -> Void) {
        if(checkEmail(email: email) && checkPassword(password: password)){
            useCase.loginWithEmail(email: email, password: password) { isLogged in
                completion(true)
            } onFailure: { error in
                print("ERROR: \(error)")
                self.customError = "Usuario o contraseña incorrector"
                completion(false)
            }
        }
        
    }
    
    func logOut(onSucces: @escaping () -> Void, onFailure: @escaping (Error) -> Void) {
        useCase.logOut {
            onSucces()
        } onFailure: { error in
            onFailure(error)
        }
    }
    
    func signUpWithEmail(email: String, firstPassword: String, secondPassword: String, completion: @escaping (Bool) -> Void){
        if(checkEmail(email: email) && checkPassword(password: firstPassword)){
            if(checkPasswordsAreEqual(firstPassword: firstPassword, secondPassword: secondPassword)){
                useCase.registerWithEmail(email: email, password: firstPassword) { user in
                    print(user)
                    completion(true)
                } onFailure: { error in
                    print("ERROR: \(error)")
                    self.customError = "Error al crear el usuario"
                    completion(false)
                }
            }
            
        }
        

    }
    
}
