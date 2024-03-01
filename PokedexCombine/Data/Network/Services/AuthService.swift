//
//  AuthService.swift
//  PokedexCombine
//
//  Created by Marcos on 28/2/24.
//

import Foundation
import FirebaseAuth
protocol AuthServiceProtocol {
    func login(email: String, password: String, onSucces: @escaping(User) -> Void, onFailure: @escaping (Error) -> Void)
    func registerWithEmail(email:String, password: String, onSucces: @escaping(User) -> Void, onFailure: @escaping(Error) -> Void)
    func logOut(onSucces: @escaping () -> Void, onFailure: @escaping (Error) -> Void) 
}


struct AuthService: AuthServiceProtocol {
    func registerWithEmail(email: String, password: String, onSucces: @escaping (User) -> Void, onFailure: @escaping (Error) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                onFailure(error)
            }else if let authResult = result {
                let id = authResult.user.uid
                let name = authResult.user.displayName
                let email = authResult.user.email
                let user = User(id: id, name: name, password: "", email: email)
                
                onSucces(user)
            }
        }
    }
    
    func login(email: String, password: String, onSucces: @escaping (User) -> Void, onFailure: @escaping (Error) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                onFailure(error)
            }else if let authResult = result {
                let id = authResult.user.uid
                let name = authResult.user.displayName
                let email = authResult.user.email
                let user = User(id: id, name: name, password: "", email: email)
        
                onSucces(user)
            }
        }
    }
    
    func isUserLogged(onSucces: @escaping(Bool) -> Void, onFailure: @escaping (Error) -> Void){
        if let user = Auth.auth().currentUser {
            onSucces(true)
        }else{
            onSucces(false)
        }

    }
    
    func logOut(onSucces: @escaping () -> Void, onFailure: @escaping (Error) -> Void) {
        do{
            try Auth.auth().signOut()
            onSucces()
        }catch let signOutError {
            onFailure(signOutError)
        }
    }
    
    
}
