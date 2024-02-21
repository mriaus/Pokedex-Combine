//
//  Extension+URLResponse.swift
//  PokedexCombine
//
//  Created by Marcos on 20/2/24.
//

import Foundation
extension URLResponse {
    
    func getStatusCode() -> Int? {
        if let httpResponse = self as? HTTPURLResponse {
            return httpResponse.statusCode
        }
        return nil
    }
}
