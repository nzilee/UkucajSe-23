//
//  CityListView.swift
//  UkucajSe-23
//
//  Created by Nikola Zivkovic on 10/29/23.
//

import SwiftUI

struct CityListView: View {
    
    @EnvironmentObject var vm: CityViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                List(vm.cities) { city in
                    Button {
                        vm.city = city
                        vm.showCityList = false
                    } label: {
                        listRowView(city: city)
                    }
                    .padding(.vertical, 4)
                    .listRowBackground(Color.clear)
                }
                .listStyle(.plain)
            }
            .navigationBarTitleDisplayMode(.large)
            .navigationTitle("Gradovi")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        vm.showCityList = false
                    } label: {
                        Text("\(Image(systemName: "chevron.left"))")
                            .fontWeight(.semibold)
                            .foregroundColor(.accentColor)
                    }
                }
                ToolbarItem(placement: .principal) {
                    VStack {
                        RoundedRectangle(cornerRadius: 15, style: .continuous)
                            .fill(Color.brightPink.opacity(0.3))
                        .frame(width: UIScreen.main.bounds.width * 0.25, height: 8)
                        Spacer()
                    }
                }
        }
        }
    }
}

struct CityListView_Previews: PreviewProvider {
    static var previews: some View {
        CityListView()
            .environmentObject(CityViewModel())
    }
}

extension CityListView {
    private func listRowView(city: City) -> some View {
        HStack {
            if let cityImage = city.image {
                Image(cityImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 45, height: 45)
                    .cornerRadius(10)
            }
            
            VStack(alignment: .leading) {
                Text(city.name)
                    .font(.lexendRegTitle2)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}
