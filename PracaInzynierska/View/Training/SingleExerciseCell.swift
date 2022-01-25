//
//  SingleExerciseCell.swift
//  PracaInzynierska
//
//  Created by Jakub Rękas on 05/01/2022.
//

import SwiftUI

struct SingleExerciseCell: View {
    @State public var int: Int
    @State public var exerciseIndex: Int
    @State public var goal: String
    @State public var drill: Exercise
    
    @State private var achieved: String = ""
    @State private var goalType: String = ""
    @State private var typeText: String = ""
    @State private var textFieldColor: Color = .gray
    @State private var keyboardType: UIKeyboardType = .decimalPad
    @State private var checkmarkColor: Color = .red
    
    
    var body: some View {
        HStack {
            HStack{
                Text("\(int)")
                    .foregroundColor(Colors().mainColor)
                TextField("\(goal)", text: $goal)
                    .foregroundColor(Colors().mainColor)
                    .fixedSize()
                    .offset(x: 35, y: 0)
                    .keyboardType(keyboardType)
                Text("\(typeText)")
                    .offset(x: 35, y: 0)
                    .font(.footnote)
                TextField("\(goalType.float)", text: $achieved)
                    .foregroundColor(textFieldColor)
                    .fixedSize()
                    .offset(x: 115, y: 0)
                    .keyboardType(keyboardType)
                    .onTapGesture(count: 1, perform: {
                        textFieldColor = Colors().mainColor
                        goalType = ""
                    })
                Text("\(typeText)")
                    .offset(x: 115, y: 0)
                    .font(.footnote)
            }
            .frame(maxWidth: .infinity, minHeight: 50, alignment: .leading)
            HStack {
                Image(systemName: "checkmark").foregroundColor(checkmarkColor)
                    .onTapGesture {
                        checkmarkColor = .green
                        textFieldColor = Colors().mainColor
                        updateResult(result: achieved.float, setIndex: (int - 1))
                    }
                Image(systemName: "ellipsis").foregroundColor(Colors().mainColor)
                    .onTapGesture {
                        print("test")
                    }
            }
            .frame(maxWidth: .infinity, minHeight: 50, alignment: .trailing)
        }
        
        .frame(maxWidth: .infinity, minHeight: 50)
        .onAppear() {
            setView()
        }
    }
    private func updateResult(result: Float, setIndex: Int){
        TrainingManager.shared.updataSet(result: result, exerciseIndex: self.exerciseIndex, setIndex: setIndex)
    }
    
    private func setView(){
        switch drill.type {
        case "forTime":
            goal = "12"
            goalType = "seconds"
            achieved = "0.0"
            typeText = "s"
        case "forPoints":
            goal = "100"
            goalType = "points"
            achieved = "0"
            typeText = "pt"
        case "forFocus":
            goal = "1.00"
            goalType = "moa"
            achieved = "0.00"
            typeText = "moa"
        default:
            print("error")
        }
    }
}
extension String {
    static let numberFormatter = NumberFormatter()
    var float: Float {
        String.numberFormatter.decimalSeparator = "."
        if let result =  String.numberFormatter.number(from: self) {
            return result.floatValue
        } else {
            String.numberFormatter.decimalSeparator = ","
            if let result = String.numberFormatter.number(from: self) {
                return result.floatValue
            }
        }
        return 0
    }
}

struct SingleExerciseCell_Previews: PreviewProvider {
    static var previews: some View {
        SingleExerciseCell(int: 5, exerciseIndex: 0, goal: "50 x 5", drill: Drills().drills[1])
            .previewLayout(.sizeThatFits)
.previewInterfaceOrientation(.portrait)
    }
}
