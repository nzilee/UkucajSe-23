//
//  RegistrationPlate.swift
//  UkucajSe-23
//
//  Created by Nikola Zivkovic on 11/3/23.
//

import Foundation

struct RegistrationPlate: Identifiable, Hashable {
    var mark: String
    let image: String
    
    var id: String {
        return mark
    }
    
    static func == (lhs: RegistrationPlate, rhs: RegistrationPlate) -> Bool {
            return lhs.id == rhs.id
        }
}
