//
//  MainViewCell.swift
//  PracaInzynierska
//
//  Created by Jakub Rękas on 10/01/2022.
//

import SwiftUI

struct MainViewCell: View {
    
    @State public var person: TrainingCellData
    
    
    var body: some View {
        HStack {
            VStack {
                HStack {
                    Text("Jakub Rekas")
                    Spacer()
                    Text(person.date, format: Date.FormatStyle().day().month().year())
                }
                HStack {
                    Text("\(person.trainingName)")
                    Spacer()
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: 76)
        
    }
}

struct TrainingCellData: Identifiable {
    let id: UUID
    let trainingName: String
    let date: Date
}

struct MainViewCell_Previews: PreviewProvider {
    static var previews: some View {
        MainViewCell(person: TrainingCellData(id: UUID(),
                                              trainingName: "Bill drill",
                                              date: Date()))
            .previewLayout(.sizeThatFits)
    }
}
