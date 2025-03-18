//
//  Fonts.swift
//  Users
//
//  Created by Borys Klykavka on 18.03.2025.
//


import SwiftUI

let fontName = "Nunito Sans"

struct Fonts {
    static let customHeading20 = Font.customFont(name: fontName, weight: .regular, size: 20)
    // lineHeight 24

    static let customBody16 = Font.customFont(name: fontName, weight: .regular, size: 16)
    // lineHeight 24

    static let customBody18 = Font.customFont(name: fontName, weight: .regular, size: 18)
    // lineHeight 24
    
    static let customBody14 = Font.customFont(name: fontName, weight: .regular, size: 14)
    // lineHeight 20

}
