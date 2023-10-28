//
//  MainView.swift
//  UkucajSe-23
//
//  Created by Nikola Zivkovic on 10/23/23.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var vm: CityViewModel
    
    @State var regPlate: String = ""
    
    let columns: [GridItem] = [
        GridItem(.adaptive(minimum: UIScreen.main.bounds.width * 0.4), spacing: UIScreen.main.bounds.width * 0.2),
        GridItem(.adaptive(minimum: UIScreen.main.bounds.width * 0.4), spacing: UIScreen.main.bounds.width * 0.2)
        ]
    
    var body: some View {
        VStack(spacing: 20) {
            dayAndTime
            
            regPlateTextField
            
            cityPickerButton
                       
            ZStack {
                MapView()
                
                VStack {
                    if vm.showZoneButtons {
                        zoneButtons
                            .padding([.horizontal, .top])
                    }
                    Spacer()
                    payParkingButton
                        .padding(.horizontal)
                    //            Spacer()
                    payManuallyButton
                }
            }
            .cornerRadius(8)
        }
        .padding(.horizontal)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(CityViewModel())
    }
}

extension MainView {
    private var zoneButtons: some View {
        //        ScrollView(.vertical, showsIndicators: false) {
        LazyVGrid(columns: columns,
                  alignment: .center,
                  spacing: UIScreen.main.bounds.width * 0.07) {
            ForEach(vm.city.parkingZones) { zone in
                ZoneButtonView(title: zone.name,
                               price: zone.price,
                               color: zone.color,
                               zone: zone)
            }
        }
                  .padding(.horizontal)
        //        }
        //        .padding(.top)
    }
    
    private var dayAndTime: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(Date.now, format: .dateTime.weekday(.wide))
                    .font(.lexendRegCaption)
                    .foregroundColor(.secondary)
                Text(Date.now, format: .dateTime.hour(.defaultDigits(amPM: .wide)).minute())
                    .font(.lexendRegTitle)
                    .foregroundColor(.primary)
            }
            Spacer()
        }
    }
    
    private var regPlateTextField: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 14)
                .fill(Color.beige.opacity(0.3))
            TextField("BG123AA", text: $regPlate)
                .font(.lexendRegTitle)
                .padding(.horizontal)
        }
        .frame(width: .infinity, height: 60)
    }
    
    private var cityPickerButton: some View {
        Button {
            
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 14)
                    .fill(Color.beige.opacity(0.3))
                
                HStack {
                    Text("\(Image(systemName: "mappin")) \(vm.city.name)")
                        .font(.lexendRegTitle2)
                        .foregroundColor(.primary)
                    Spacer()
                }
                .padding(.leading)
            }
            .frame(height: 60)
        }
    }
    
    private var payParkingButton: some View {
        Button {
            vm.toggleZoneButtons()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.brightPink)
                
                Text("UPLATI PARKING")
                    .font(.lexendMedTitle2)
                    .foregroundColor(.primary)
            }
//            .shadow(color: .black.opacity(0.2), radius: 15, x: 0, y: 0)
            .frame(height: 62)
        }

    }
    
    private var payManuallyButton: some View {
        Button {
            
        } label: {
            ZStack {
                Rectangle()
//                    .fill(.orange)
                    .fill(Material.ultraThinMaterial)
                
                Text("Uplati sam")
                    .font(.lexendRegFootnote)
                    .foregroundColor(.primary)
            }
            .shadow(color: .black.opacity(0.2), radius: 2, x: 0, y: 0)
            .frame(height: 62)
        }

    }
    
}
