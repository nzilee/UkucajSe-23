//
//  City.swift
//  UkucajSe-23
//
//  Created by Nikola Zivkovic on 10/22/23.
//

import Foundation

struct City: Identifiable {
    let name: String
    let image: String
    let parkingZones: [ParkingZone]
    
    var id: String {
        name
    }
}
