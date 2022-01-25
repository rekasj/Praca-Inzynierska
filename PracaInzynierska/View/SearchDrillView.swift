//
//  SearchDrillView.swift
//  PracaInzynierska
//
//  Created by Jakub Rękas on 11/12/2021.
//

import SwiftUI

struct SearchDrillView: View {
    @State private var drills = Drills()
    @State private var colors = Colors()
    @State private var searchingFor = ""
    @State private var addIsPresented: Bool = false
    @Binding var selectedDrill: Exercise
    @Binding var isPresented: Bool
    
    var body: some View {
        NavigationView{
            List {
                ForEach(results) { drill in
                    Button(action:{
                        self.selectedDrill = drill
                        if self.selectedDrill.name == " Własny" {
                            self.addIsPresented = true
                        } else {
                        self.isPresented = false
                        }
                    }, label:{
                        Text("\(drill.name)")
                    }).sheet(isPresented: self.$addIsPresented, onDismiss: {
                        drills.drills = drills.drills.sorted(by: {$0.name < $1.name})
                    }) {
                        AddExerciseView(isPresented: $addIsPresented, drills: $drills)
                    }
                }
                .navigationBarTitle("Drills").foregroundColor(colors.mainColor)
                
            }
        }
        .searchable(text: $searchingFor)
        .navigationViewStyle(StackNavigationViewStyle())
        

        .onAppear() {
            UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(colors.mainColor)]
            drills.drills = drills.drills.sorted(by: {$0.name < $1.name})
        }
        .onDisappear() {
            self.isPresented = false
        }
    }
    
    var results: [Exercise] {
        if searchingFor.isEmpty {
            return drills.drills
        } else {
            return drills.drills.filter { $0.name.contains(searchingFor)}
        }
    }
}

struct SearchDrillView_Previews: PreviewProvider {
    static var previews: some View {
        SearchDrillView(selectedDrill: .constant(Exercise(id: UUID(), name: String(), type: "forTime")), isPresented: .constant(false))
            .previewInterfaceOrientation(.portrait)
            .previewLayout(.device)
            .previewDevice("iPhone 13 Pro")
    }
}
