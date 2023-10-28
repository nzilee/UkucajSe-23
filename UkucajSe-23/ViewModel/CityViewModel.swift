//
//  CityViewModel.swift
//  UkucajSe-23
//
//  Created by Nikola Zivkovic on 10/23/23.
//

import Foundation
import SwiftUI

class CityViewModel: ObservableObject {
    
    @Published var cities: [City]
    @Published var city: City
    @Published var parkingZone: ParkingZone? = nil
    @Published var showCityList: Bool = false
    @Published var showZoneButtons: Bool = false
    
    init() {
        let cities = CityParkingData.shared.cities
        self.cities = cities
        self.city = cities[1]
    }
    
    func selectCity(city: City) {
        self.city = city
    }
    
    func selectParkingZone(parkingZone: ParkingZone) {
        self.parkingZone = parkingZone
    }
    
    func toggleCityMenu() {
//        withAnimation(.easeInOut) {
//            self.showCityMenu.toggle()
//        }
    }
    
    func toggleZoneButtons() {
        withAnimation(.linear) {
            self.showZoneButtons.toggle()
        }
//        self.showZoneButtons.toggle()
    }
}
