//
//  ZoneButtonView.swift
//  UkucajSe-23
//
//  Created by Nikola Zivkovic on 10/23/23.
//

import SwiftUI

struct ZoneButtonView: View {
    
    @EnvironmentObject var vm: CityViewModel
    
    let title: String
    let price: Int
    let color: Color
    let zone: ParkingZone
    
    let size: CGFloat = UIScreen.main.bounds.width * 0.4
    
    var body: some View {
        
        Button {
            vm.selectParkingZone(parkingZone: zone)
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.beige)
                
                VStack {
                    Spacer()
                    HStack {
                        Text(String(price))
                            .font(.lexendRegLarge)
                            .minimumScaleFactor(0.7)
                            .foregroundColor(.primary)
                        
                        VStack(alignment: .leading, spacing: 0) {
                            Text("RSD")
                                .foregroundColor(.secondary)
                            Text(",00")
                                .foregroundColor(.primary)
                                
                        }
                        .font(.lexendRegTitle2)
                    }
                    .padding([.horizontal, .top], 10)
                    
                    Spacer()
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 6)
                            .fill(color.opacity(0.3))
                        
                        Text(title)
                            .font(.lexendRegTitle)
                            .lineLimit(0)
                            .minimumScaleFactor(0.3)
                            .multilineTextAlignment(.center)
                            .foregroundColor(color)
                            .padding()
                        
                        
                    }
                    .padding([.horizontal, .bottom], 10)
                }
            }
            .frame(width: size, height: size)

        }
        
        
    }
}

struct ZoneButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ZoneButtonView(title: "Extra Zona",
                       price: 450,
                       color: .brightBlue,
                       zone: ParkingZone(name: "II",
                                         zoneNumber: "123",
                                         price: 50,
                                         color: .blue))
            .environmentObject(CityViewModel())
    }
}
