//
//  ParkingZone.swift
//  UkucajSe-23
//
//  Created by Nikola Zivkovic on 10/22/23.
//

import Foundation
import SwiftUI

struct ParkingZone: Identifiable {
    let name: String
    let zoneNumber: String
    let price: Int
    let color: Color
    
    var id: String {
        name + String(zoneNumber)
    }
}
