//
//  Fonts+.swift
//  Users
//
//  Created by Borys Klykavka on 18.03.2025.
//

import SwiftUI

extension Font {

    static func customFont(name: String, weight: Font.Weight, size: CGFloat) -> Font {

        if UIFont(name: name, size: size) == nil {
            print("error: Font+")
            return Font.system(size: size, weight: weight)
        }

        return Font.custom(name, size: size).weight(weight)
    }

}
