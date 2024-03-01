//
//  UseCaseAuthProtocol.swift
//  PokedexCombine
//
//  Created by Marcos on 28/2/24.
//

import Foundation
protocol UseCaseAuthProtocol {
    func loginWithEmail(email:String, password:String ,onSuccess: @escaping (User) -> Void, onFailure: @escaping (Error) -> Void)
    func logOut(onSucces: @escaping () -> Void, onFailure: @escaping (Error) -> Void) 
    func register()
    func recoverPassword()
    
}
