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
    

    init(useCase: UseCaseAuthProtocol) {
        self.useCase = useCase
    }
    
    func loginWithEmail(email: String, password: String, completion: @escaping (Bool) -> Void) {
        useCase.loginWithEmail(email: email, password: password) { isLogged in
            print(isLogged)
            completion(true)
        } onFailure: { error in
            print("ERROR: \(error)")
            completion(false)
        }
    }
    
    func logOut(onSucces: @escaping () -> Void, onFailure: @escaping (Error) -> Void) {
        useCase.logOut {
            onSucces()
        } onFailure: { error in
            onFailure(error)
        }

    }
    
}
