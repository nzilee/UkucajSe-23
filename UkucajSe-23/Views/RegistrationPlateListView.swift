//
//  RegistrationPlateListView.swift
//  UkucajSe-23
//
//  Created by Nikola Zivkovic on 11/5/23.
//

import SwiftUI


struct RegistrationPlateListView: View {
    
    @EnvironmentObject var vm: CityViewModel
    
    @State var isEditing: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(vm.regPLATES) { regPlate in
                        listRowView(regPlate: regPlate)
                    }
                    .onDelete { row in
                        withAnimation {
                            vm.removePlateAt(row)
                        }
                    }
                    .onMove(perform: { vm.regPLATES.move(fromOffsets: $0, toOffset: $1) })
                }
                .padding(.vertical, 4)
                .listRowBackground(Color.clear)
                .listStyle(.plain)
                .environment(\.editMode, .constant(self.isEditing ? EditMode.active : EditMode.inactive))
                .animation(.spring(), value: vm.regPLATES.count)
            }
            .navigationBarTitleDisplayMode(.large)
            .navigationTitle("Sačuvane registracije")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        withAnimation {
                            isEditing.toggle()
                        }
                    } label: {
                        if self.isEditing {
                            Text("Done")
                                .foregroundColor(.green)
                                .fontWeight(.bold)
                        } else {
                            Text("Edit")
                                .fontWeight(.semibold)
                        }
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
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        vm.toggleRegPlatesList()
                    } label: {
                        Text("\(Image(systemName: "arrow.turn.up.left"))")
                            .fontWeight(.semibold)
                    }
                }
            }
        }
    }
}

extension RegistrationPlateListView {
    private func listRowView(regPlate: RegistrationPlate) -> some View {
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: 6)
                    .fill(.ultraThickMaterial)
                    .frame(width: 60, height: 60)
                
                if let imageName = regPlate.image {
                    Image(imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 55, height: 55)
                }
            }
            
            VStack(alignment: .leading) {
                Text(regPlate.mark)
                    .font(.title)
            }
            .frame(maxWidth: UIScreen.main.bounds.width, alignment: .leading)
        }
    }
}


struct RegistrationPlateListView_Previews: PreviewProvider {
    static var previews: some View {
            RegistrationPlateListView()
                .environmentObject(CityViewModel())
    }
}

