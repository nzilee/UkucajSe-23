//
//  UkucajSe_23App.swift
//  UkucajSe-23
//
//  Created by Nikola Zivkovic on 10/21/23.
//

import SwiftUI

@main
struct UkucajSe_23App: App {
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(CityViewModel())
        }
    }
}
