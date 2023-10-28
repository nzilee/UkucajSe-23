//
//  MapView.swift
//  UkucajSe-23
//
//  Created by Nikola Zivkovic on 10/28/23.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @StateObject private var vm = MapViewModel()
    
    @State var permissionDenied: Bool = false
    
    var body: some View {
        Map(coordinateRegion: $vm.region, interactionModes: .zoom, showsUserLocation: true, userTrackingMode: .constant(.follow))
            .onAppear {
                vm.checkIfLocationServicesIsEnabled()
            }
            .alert(isPresented: $vm.permissionDenied) {
                Alert(title: Text("Permission Denied"),
                      message: Text("Please enable permission in app settings"),
                      dismissButton: .default(Text("Go to Settings"), action: {
                    UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
                }))
            }
    }
    
    struct MapView_Previews: PreviewProvider {
        static var previews: some View {
            MapView()
        }
    }
    
    final class MapViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
        
        @Published var region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(
                latitude: 44.1122542,
                longitude: 21.0060835),
            span: MKCoordinateSpan(latitudeDelta: 5,
                                   longitudeDelta: 5))
        
        @Published var permissionDenied: Bool = false
        
        var locationManager: CLLocationManager?
        
        func checkIfLocationServicesIsEnabled() {
            if CLLocationManager.locationServicesEnabled() {
                locationManager = CLLocationManager()
                locationManager?.desiredAccuracy = kCLLocationAccuracyBest
                locationManager!.delegate = self
            } else {
                print("Show an alert letting the user know this is off.")
            }
        }
        
        private func checkLocationAuthorization() {
            guard let locationManager = locationManager else { return }
            
            switch locationManager.authorizationStatus {
            case .notDetermined:
                locationManager.requestWhenInUseAuthorization()
            case .restricted:
                print("Your location is restricted")
            case .denied:
                print("Your have denied this app location permission. Go into settings to change it.")
                permissionDenied.toggle()
            case .authorizedAlways, .authorizedWhenInUse:
                guard let location = locationManager.location else { return }
                
                DispatchQueue.main.async {
                    withAnimation(.easeIn) {
                        self.region = MKCoordinateRegion(
                            center: location.coordinate,
                            span: MKCoordinateSpan(
                                latitudeDelta: 0.015,
                                longitudeDelta: 0.015))
                    }
                }
                
            @unknown default:
                break
            }
        }
        
        func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
            checkLocationAuthorization()
        }
        
        func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
            print(error.localizedDescription)
        }
        
    }
}

