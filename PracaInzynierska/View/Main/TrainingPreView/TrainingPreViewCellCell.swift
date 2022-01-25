//
//  TraininigPreViewCellCell.swift
//  PracaInzynierska
//
//  Created by Jakub Rękas on 05/01/2022.
//

import SwiftUI

struct TrainingPreViewCellCell: View {
    
    @State public var int: Int
    @State public var type: String
    
    @State public var achieved: Float
    @State private var typeText: String = ""
    
    var body: some View {
        HStack {
            HStack{
                Text("\(int)")
                    .foregroundColor(Colors().mainColor)
                Text("\(String(format: "%.2f", achieved))")
                    .foregroundColor(Colors().mainColor)
                    .fixedSize()
                    .offset(x: 100, y: 0)
                Text("\(typeText)")
                    .offset(x: 100, y: 0)
                    .font(.footnote)
            }
            .frame(maxWidth: .infinity, minHeight: 50, alignment: .leading)
            
        }
        .frame(maxWidth: .infinity, minHeight: 50)
        .onAppear() {
            setView()
        }
    }
    
    private func setView(){
        switch type {
        case "forTime":
            achieved = 0
            typeText = "s"
        case "forPoints":
            achieved = 00.0
            typeText = "pt"
        case "forFocus":
            achieved = 0.0
            typeText = "moa"
        default:
            print("test")
        }
    }
}

struct TrainingPreViewCellCell_Previews: PreviewProvider {
    static var previews: some View {
        TrainingPreViewCellCell(int: 1, type: "", achieved: 0)
            .previewLayout(.sizeThatFits)
.previewInterfaceOrientation(.portrait)
    }
}
