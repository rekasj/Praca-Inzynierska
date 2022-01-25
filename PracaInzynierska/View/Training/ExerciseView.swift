//
//  ExerciseView.swift
//  PracaInzynierska
//
//  Created by Jakub Rękas on 04/01/2022.
//

import SwiftUI
import CoreData

struct ExerciseView: View {
    @State public var trainingTitle: String = ""
    @State private var date: Date = Date()
    
    @State private var showingAlert: Bool = false
    @State private var check: Bool = false
    @State private var isPresented: Bool = false
    @State private var listCount: [Int] = []
    @State private var singleExerciseViewHeight: [CGFloat] = []
    @State private var selectedDrill: Exercise = Exercise(id: UUID(), name: String(), type: String())
    
    @State private var TM = TrainingManager.shared
    
    
    var body: some View {
        NavigationView {
            VStack{
                List {
                    Section{
                        HStack {
                            Text("Start Time").padding()
                            Spacer()
                            Text("Today, \(date.formatted())").padding()
                        }
                        .foregroundColor(Colors().mainColor)
                    }
                    ForEach(listCount, id: \.self) { i in
                        SingleExerciseView(selectedDrill: selectedDrill, index: i, height: $singleExerciseViewHeight[i]).frame(height: singleExerciseViewHeight[i])
                    }
                    .listRowInsets(EdgeInsets())
                    Section {
                        Button("+ Exercise") {
                            self.isPresented = true
                        }.sheet(isPresented: self.$isPresented, onDismiss: {
                            addExercise()
                        }) {
                            SearchDrillView(selectedDrill: $selectedDrill, isPresented: $isPresented)
                        }
                    }
                }
                .navigationTitle(Text("\(trainingTitle)"))
                .navigationBarTitleDisplayMode(.inline)
                .listStyle(GroupedListStyle())
                .foregroundColor(Colors().mainColor)
                
                Spacer()
                
                Button("Save training") {
                    if check {
                    TM.saveTraining()
                    CoreDataManager().saveTraining(trainingModel: TM.temp)
                    print("Training saved")
                    } else {
                        showingAlert = true
                    }
                }
                .alert("All checkmarks are green? ", isPresented: $showingAlert) {
                    Button("OK", role: .cancel) {
                        check = true
                    }
                }
                .foregroundColor(Colors().mainColor)
                .padding(.bottom, 25)
            }
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        self.dismissKeyboard()
                    }
                }
            }
        }
        .onAppear() {
            UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(Colors().mainColor)]
        }
        
    }
    
    private func getDate() ->String{
         let time = Date()
         let timeFormatter = DateFormatter()
         timeFormatter.dateFormat = "HH:ss"
         let stringDate = timeFormatter.string(from: time)
         return stringDate
    }
    private func addExercise() {
        if listCount.isEmpty {
            TM.buildTraining(title: trainingTitle, date: date)
            print("test")
        }
        
        TM.addExercise(name: selectedDrill.name, type: selectedDrill.type)
        
        let count = listCount.count
        listCount.append(count)
        singleExerciseViewHeight.append(CGFloat(135))
    }
}

struct ExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseView()
    }
}
