//
//  Extension+Color.swift
//  PokedexCombine
//
//  Created by Marcos on 28/2/24.
//

import Foundation
import SwiftUI

extension Color {
    init(hex: Int, alpha: Double = 1.0) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xFF) / 255.0,
            green: Double((hex >> 8) & 0xFF) / 255.0,
            blue: Double(hex & 0xFF) / 255.0,
            opacity: alpha
        )
    }
}
