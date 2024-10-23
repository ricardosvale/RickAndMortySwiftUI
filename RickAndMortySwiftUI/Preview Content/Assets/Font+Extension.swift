//
//  Font+Extension.swift
//  RickAndMortySwiftUI
//
//  Created by Ricardo Silva Vale on 23/10/24.
//

import SwiftUI

extension Font {
   enum Jost {
        case regular
        case bold
        case medium
        
        var fontName: String {
            switch self {
            case .regular:
                return "Jost-Regular"
            case .bold:
                return "Jost-Bold"
            case .medium:
                return "Jost-Medium"
            }
        }
    }
    static func jockeyOne( size: CGFloat) -> Font {
       return Font.custom("JockeyOne-Regular", size: size)
   }

     static func jost(_ type: Jost, size: CGFloat) -> Font {
        return Font.custom(type.fontName, size: size)
    }
}
