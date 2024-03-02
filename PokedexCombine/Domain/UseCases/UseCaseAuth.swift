//
//  UseCaseAuth.swift
//  PokedexCombine
//
//  Created by Marcos on 28/2/24.
//

import Foundation
import FirebaseAuth

final class UseCaseAuth: UseCaseAuthProtocol {
    func loginWithEmailmock(email: String, password: String, onSuccess: @escaping (User) -> Void, onFailure: @escaping (Error) -> Void) {
        //TODO
    }
    
    func logOutMock(onSucces: @escaping () -> Void, onFailure: @escaping (Error) -> Void) {
        //TODO
    }
    
    func registerWithEmailMock(email: String, password: String, onSuccess: @escaping (User) -> Void, onFailure: @escaping (Error) -> Void) {
        //TODO
    }
    

    func loginWithEmail(email: String, password: String, onSuccess: @escaping (User) -> Void, onFailure: @escaping (Error) -> Void) {
        return AuthService().login(email: email, password: password, onSucces: onSuccess, onFailure: onFailure)
    }
    
 
    
    func registerWithEmail(email:String, password:String ,onSuccess: @escaping (User) -> Void, onFailure: @escaping (Error) -> Void){
        return AuthService().registerWithEmail(email: email, password: password, onSucces: onSuccess, onFailure: onFailure)
    }

    
    func recoverPassword() {
        //
    }
    
    func logOut(onSucces: @escaping () -> Void, onFailure: @escaping (Error) -> Void)  {
        return AuthService().logOut(onSucces: onSucces, onFailure: onFailure)
    }
    
    
    
}
