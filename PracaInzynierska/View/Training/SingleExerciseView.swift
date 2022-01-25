//
//  SingleExerciseView.swift
//  PracaInzynierska
//
//  Created by Jakub Rękas on 05/01/2022.
//

import SwiftUI

struct SingleExerciseView: View {
    @State private var colors = Colors()
    @State private var listCount: [Int] = [1]
    @State public var selectedDrill: Exercise = Drills().drills[1]
    @State public var index: Int
    
    @Binding public var height: CGFloat
    
    @State public var results: [Float] = []
    
    
    var body: some View {
        VStack {
            List{
                Section(header: ListHeader(drill: self.selectedDrill), footer: ListFooter(height: $height, listCount: $listCount, index: index))
                {
                    ForEach(listCount, id: \.self) { values in
                        SingleExerciseCell(int: values, exerciseIndex: index, goal: "", drill: selectedDrill)
                    }
                    
                }
                .listRowInsets(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
            }
            .environment(\.defaultMinListRowHeight, 50)
            .frame(maxWidth: .infinity, maxHeight: height)
            .listStyle(GroupedListStyle())
            .onAppear(){
                TrainingManager.shared.addSet(result: Float(), exerciseIndex: index)
            }
        }
    }
}
        
struct ListHeader: View {
    @State public var drill: Exercise
    
    var body: some View {
        VStack {
            Text("\(drill.name)")
                .font(.headline)
            HStack {
                Text("Set ")
                    .position(x: 7, y: 0)
                Text("Goal \(type)")
                    .position(x: -45, y: 0)
                Text("Achieved \(type)")
                    .position(x: -45, y: 0)
            }
        }
        .foregroundColor(Colors().mainColor)
    }
    
    var type: String {
        switch drill.type {
        case "forTime":
            return "time"
        case "forPoints":
            return "points"
        case "forFocus":
            return "moa"
        default:
            return "error"
        }
    }
}
struct ListFooter: View {
    @Binding public var height: CGFloat
    @Binding public var listCount: [Int]
    @State public var index: Int
    var body: some View {
        Button(action:{
            self.height = self.height + 50
            let count = self.listCount.count + 1
            self.listCount.append(count)
            TrainingManager.shared.addSet(result: 0, exerciseIndex: index)
        }, label:{
            Text("+")
        })
        .foregroundColor(Colors().mainColor)
    }
}


struct SingleExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        SingleExerciseView(index: 0, height: .constant(CGFloat(135)))
            .previewLayout(.sizeThatFits)
    }
}

