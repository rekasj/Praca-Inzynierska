//
//  AddExerciseView.swift
//  PracaInzynierska
//
//  Created by Jakub Rękas on 25/01/2022.
//

import SwiftUI

struct AddExerciseView: View {
    
    @State private var name: String = ""
    @State private var selectedType = "-> Choose type <-"
    @State private var showingAlert = false
    @Binding public var isPresented: Bool
    @Binding public var drills: Drills
    let types = ["-> Choose type <-","forTime", "forPoints", "forFocus"]
    
    var body: some View {
        VStack{
            VStack {
                TextField("Exercise name...", text: $name)
                
                Picker("Strength", selection: $selectedType) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                
                Spacer()
                Button("Add Exercise") {
                    if (name == "" || selectedType == "-> Choose type <-") {
                        self.isPresented = true
                        showingAlert = true
                    }
                    drills.drills.append(Exercise(id: UUID(), name: name, type: selectedType))
                    self.isPresented = false
                }
                .alert("Write name or choose type", isPresented: $showingAlert) {
                    Button("OK", role: .cancel) { }
                }
                
            }
            .frame(width: .infinity, height: 160, alignment: .center)
        }
        .frame(width: .infinity, height: 200, alignment: .center)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
            .stroke(Color.gray, lineWidth: 4)
        )
    }
}

struct AddExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        AddExerciseView(isPresented: .constant(false), drills: .constant(Drills()))
            .previewLayout(.sizeThatFits)
    }
}
