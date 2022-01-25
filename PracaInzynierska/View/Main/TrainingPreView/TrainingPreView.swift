//
//  TrainingPreView.swift
//  PracaInzynierska
//
//  Created by Jakub Rękas on 25/01/2022.
//

import SwiftUI

struct TrainingPreView: View {
    @State public var training: TrainingCellData
    
    @State private var listCount: [Int] = []
    @State private var height: CGFloat = CGFloat()
    
    var body: some View {
        NavigationView {
            VStack{
                List {
                    Section{
                        HStack {
                            Text("When: ").padding()
                            Spacer()
                            Text(training.date, format: Date.FormatStyle().day().month().year()).padding()
                        }
                        .foregroundColor(Colors().mainColor)
                    }
                    ForEach(results) { i in
                        TrainingPreViewCell(exercise: i, height: $height).frame(height: height)
                    }
                    .listRowInsets(EdgeInsets())
                    
                }
                .navigationBarTitle(training.trainingName)
                .navigationBarTitleDisplayMode(.inline)
                .listStyle(GroupedListStyle())
                .foregroundColor(Colors().mainColor)
                
            }
            
        }
        .onAppear() {
        }
        
    }
    
    
    var results: [ExerciseCell] {
        var temparray = [ExerciseCell]()
        let exercises = CoreDataManager().getExercises()
        
        for exercise in exercises {
            temparray.append(ExerciseCell(id: exercise.id ?? UUID(),
                                          name: exercise.name ?? "",
                                          type: exercise.type ?? "",
                                          trainingID: exercise.trainingid ?? UUID()))
        }
        
        return temparray.filter { $0.trainingID == training.id}
    }
    
    
    
}
struct ExerciseCell: Identifiable {
    var id: UUID
    var name: String
    var type: String
    var trainingID: UUID
}

struct TrainingPreView_Previews: PreviewProvider {
    static var previews: some View {
        TrainingPreView(training: TrainingCellData(id: UUID(), trainingName: "TEST", date: Date()))
    }
}
