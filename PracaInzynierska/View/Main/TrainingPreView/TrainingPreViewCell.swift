//
//  TrainingPreView.swift
//  PracaInzynierska
//
//  Created by Jakub Rękas on 05/01/2022.
//

import SwiftUI

struct TrainingPreViewCell: View {
    @State private var colors = Colors()
    @State private var listCount: [Int] = [1]
    @State public var exercise: ExerciseCell
    @Binding public var height: CGFloat
    @State private var i: Int = 0
    
    var body: some View {
        VStack {
            List{
                Section(header: Header(exercise: self.exercise)) {
                    ForEach(results) { result in
                        TrainingPreViewCellCell(int: result.id, type: exercise.type, achieved: result.result )
                    }
                }
                .listRowInsets(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
            }
            .environment(\.defaultMinListRowHeight, 50)
            .frame(maxWidth: .infinity, maxHeight: returnHeight())
            .listStyle(GroupedListStyle())
            .onAppear(){
            }
        }
    }
    var tempResults: [SetCell] {
        var temparray = [SetCell]()
        let sets = CoreDataManager().getSets()
        var i = 0
        for oneSet in sets {
            i+=1
            temparray.append(SetCell(id: i,
                                     result: oneSet.result,
                                     exerciseID: oneSet.exerciseid ?? UUID()))
        }
        
        return temparray.filter { $0.exerciseID == exercise.id}
    }
    
    var results: [SetCell] {
        var temp = tempResults
        for i in 0..<temp.count {
            temp[i].id = i+1
        }
        return temp
    }
    
    private func returnHeight() -> CGFloat{
        height = (50 + (CGFloat(50*results.count)))
        return height
    }


}

struct SetCell: Identifiable {
    var id: Int
    var result: Float
    var exerciseID: UUID
}
        
struct Header: View {
    @State public var exercise: ExerciseCell
    
    var body: some View {
        VStack {
            Text("\(exercise.name)")
                .font(.headline)
            HStack {
                Text("Set ")
                    .position(x: 7, y: 0)
                Text("Achieved \(type)")
                    .position(x: -45, y: 0)
            }
        }
        .foregroundColor(Colors().mainColor)
    }
    
    var type: String {
        switch exercise.type {
        case "forTime":
            return "time"
        case "forPoints":
            return "points"
        case "forFocus":
            return "moa"
        default:
            return ""
        }
    }
}



struct TrainingPreViewCell_Previews: PreviewProvider {
    static var previews: some View {
        TrainingPreViewCell(exercise: ExerciseCell(id: UUID(), name: "", type: "", trainingID: UUID()), height: .constant(CGFloat(200)))
            .previewLayout(.sizeThatFits)
    }
}

