//
//  UseCaseAuthProtocol.swift
//  PokedexCombine
//
//  Created by Marcos on 28/2/24.
//

protocol UseCaseAuthProtocol {
    func loginWithEmailmock(email:String, password:String ,onSuccess: @escaping (User) -> Void, onFailure: @escaping (Error) -> Void)
    func loginWithEmail(email:String, password:String ,onSuccess: @escaping (User) -> Void, onFailure: @escaping (Error) -> Void)
    func logOut(onSucces: @escaping () -> Void, onFailure: @escaping (Error) -> Void)
    func logOutMock(onSucces: @escaping () -> Void, onFailure: @escaping (Error) -> Void)
    func registerWithEmail(email:String, password:String ,onSuccess: @escaping (User) -> Void, onFailure: @escaping (Error) -> Void)
    func registerWithEmailMock(email:String, password:String ,onSuccess: @escaping (User) -> Void, onFailure: @escaping (Error) -> Void)
    func recoverPassword()
}
