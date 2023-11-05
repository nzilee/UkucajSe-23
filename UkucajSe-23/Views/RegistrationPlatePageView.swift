//
//  RegistrationPlatePageView.swift
//  UkucajSe-23
//
//  Created by Nikola Zivkovic on 11/3/23.
//

import SwiftUI

struct RegistrationPlatePageView: View {
    
    @EnvironmentObject var vm: CityViewModel
    
//    @State var regMark: String = ""
    
    @State var selectedTab: Int = 0
    
    var body: some View {
        HStack {
            TabView(selection: $selectedTab) {
                ForEach(vm.regPLATES) { plate in
                    RegPlateView(mark: plate.mark)
                        .padding(.horizontal, vm.isRegistrationPlateEmpty ? 3 : 0)
                        .allowsHitTesting(true)
                        .tag(plate.hashValue)
                        .tabItem {
                            Text("regPlate: \(plate.mark)")
                        }
                }
            }
            .indexViewStyle(.page(backgroundDisplayMode: .never))
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
        }
        .frame(height: UIScreen.main.bounds.height * 0.085)
    }
}

struct RegistrationPlatePageView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationPlatePageView()
            .preferredColorScheme(.dark)
            .environmentObject(CityViewModel())
    }
}

struct RegPlateView: View {
    
    @EnvironmentObject var vm: CityViewModel
    
    @State var mark: String = ""
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 14)
                .fill(Color.beige.opacity(0.3))
                .overlay {
                    RoundedRectangle(cornerRadius: 14)
                        .stroke(vm.isRegistrationPlateEmpty ? .red : .clear, lineWidth: 3)
                }
                
            VStack {
                TextField("BG123AA", text: $mark)
                    .font(.lexendRegTitle)
                    .padding(.horizontal)
                    .multilineTextAlignment(.center)
                    .frame(width: UIScreen.main.bounds.width * 0.6)
                
                Spacer()
                
            }
            .padding(.top, 4)
            .allowsHitTesting(true)
            .onChange(of: mark) { newRegMark in
                vm.updateRegistrationPlate(with: newRegMark)
                vm.checkIfRegPlateIsEmpty()
            }
            .onAppear {
                vm.updateRegistrationPlate(with: mark)
            }
        }
        .frame(height: 60)
    }
}
