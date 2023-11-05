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
    @Published var currentHoursAndMinutes: String = Date.now.formatted(.dateTime.hour(.defaultDigits(amPM: .wide)).minute())
    
    @Published var showMessage: Bool = false
    
    
    @Published var regPlate: RegistrationPlate
    @Published var regPLATES: [RegistrationPlate]
    
    @Published var registrationPlate: String = ""
    @Published var isRegistrationPlateEmpty: Bool = false
    
    @Published var parkingZoneNumber: String = ""
    
    init() {
        let cities = CityParkingData.shared.cities
        self.cities = cities
        self.city = cities[1]
        
        let platesData = CityParkingData.shared.regPlates_
        self.regPLATES = platesData
        self.regPlate = platesData[0]
    }
    
    func selectCity(city: City) {
        self.city = city
    }
    
    func selectParkingZone(parkingZone: ParkingZone) {
        self.parkingZone = parkingZone
    }
    
    func setParkingZoneNumber(to number: String) {
        self.parkingZoneNumber = number
    }
    
    func toggleCityList() {
        withAnimation(.easeInOut) {
            self.showCityList.toggle()
        }
    }
    
    func toggleZoneButtons() {
        withAnimation(.linear) {
            self.showZoneButtons.toggle()
        }
//        self.showZoneButtons.toggle()
    }
    
    func getCurrentHourAndMinute(){
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {_ in
            self.currentHoursAndMinutes = Date.now.formatted(.dateTime.hour(.defaultDigits(amPM: .wide)).minute())
        }
        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0) {
//            self.currentHoursAndMinutes = currentHourAndMinute
//
//            if !self.stop {
//                self.getCurrentHourAndMinute()
//            }
//        }
    }
    
    func showMessageUI() {
        
//        if registrationPlate == "" {
//            self.isRegistrationPlateEmpty = true
//        } else {
//            self.showMessage.toggle()
//            self.isRegistrationPlateEmpty = false
//        }
        
        if !isRegistrationPlateEmpty {
            self.showMessage.toggle()
        }
        
    }
    
    func updateRegistrationPlate(with regPlate: String) {
        self.registrationPlate = regPlate
    }
    
    func checkIfRegPlateIsEmpty() {
        if registrationPlate == "" {
            withAnimation {
                self.isRegistrationPlateEmpty = true
            }
        } else {
            withAnimation {
                self.isRegistrationPlateEmpty = false
            }
        }
    }
}
