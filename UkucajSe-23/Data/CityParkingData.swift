//
//  CityParkingData.swift
//  UkucajSe-23
//
//  Created by Nikola Zivkovic on 10/22/23.
//

import Foundation

class CityParkingData {
    static let shared = CityParkingData()
    
    let cities: [City] = [
            City(name: "Nis",
                 image: "grbNis",
                 parkingZones: [
                    ParkingZone(name: "Zona I",
                                zoneNumber: "9181",
                                price: 60,
                                color: .brightPink),
                    ParkingZone(name: "Zona II",
                                zoneNumber: "9182",
                                price: 45,
                                color: .brightGreen),
                    ParkingZone(name: "Extra Zona",
                                zoneNumber: "9180",
                                price: 90,
                                color: .brightOrange)
                 ]
                ),
            City(name: "Beograd",
                 image: "grbBeograd",
                 parkingZones: [
                    ParkingZone(name: "Zona I",
                                zoneNumber: "1bg",
                                price: 6,
                                color: .brightPink),
                    ParkingZone(name: "Zona II",
                                zoneNumber: "2bg",
                                price: 8,
                                color: .brightGreen),
                    ParkingZone(name: "Zona III",
                                zoneNumber: "3bg",
                                price: 7,
                                color: .brightOrange),
                    ParkingZone(name: "Zona IV",
                                zoneNumber: "4bg",
                                price: 8,
                                color: .brightBlue)
                 ]),
            City(name: "Novi Sad",
                 image: "grbNoviSad",
                 parkingZones: [
                    ParkingZone(name: "Zona I",
                                zoneNumber: "1ns",
                                price: 6,
                                color: .brightPink),
                    ParkingZone(name: "Zona II",
                                zoneNumber: "2ns",
                                price: 8,
                                color: .brightGreen),
                    ParkingZone(name: "Zona III",
                                zoneNumber: "3ns",
                                price: 7,
                                color: .brightOrange)
                 ])
        ]
    
    
    let regPlates_: [RegistrationPlate] = [
        RegistrationPlate(mark: "NI314MP", image: "bmw"),
        RegistrationPlate(mark: "BG887OL", image: "mercedes"),
        RegistrationPlate(mark: "TT644UI", image: "volvo")
    ]
    
    
}
