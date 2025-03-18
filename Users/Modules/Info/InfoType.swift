//
//  InfoType.swift
//  Users
//
//  Created by Borys Klykavka on 18.03.2025.
//

import Foundation
import SwiftUI

enum InfoType {
    
    case alreadyRegistered,
         noInternet,
         successfullyRegistered
    
    var imageName: String {
        switch self {
        case .alreadyRegistered: return GeneralConstants.alreadyRegistered
        case .noInternet: return GeneralConstants.noInternet
        case .successfullyRegistered: return GeneralConstants.successRegistered
        }
    }

    var message: String {
        switch self {
        case .alreadyRegistered: return GeneralConstants.alreadyRegistered
        case .noInternet: return GeneralConstants.noInternet
        case .         successfullyRegistered: return GeneralConstants.successRegistered
        }
    }

    var buttonTitle: String {
        switch self {
        case .alreadyRegistered: return GeneralConstants.tryAgain
        case .noInternet: return GeneralConstants.tryAgain
        case .successfullyRegistered: return GeneralConstants.gotIt
        }
    }
    
}
