//
//  String+.swift
//  Users
//
//  Created by Borys Klykavka on 18.03.2025.
//

import Foundation

extension String {
    var localized: String {
        NSLocalizedString(self, comment: "")
    }
}
