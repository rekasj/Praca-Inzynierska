//
//  ExampleView.swift
//  PracaInzynierska
//
//  Created by Jakub Rękas on 25/01/2022.
//

import SwiftUI
import CoreData

struct ExampleView: View {
    
    @State private var trainings: [TrainingDataModel] = [TrainingDataModel]()
    
    var body: some View {
        List(trainings, id: \.self) { training in
            Text("\(training.id ?? UUID())")
            Text("\(training.title ?? "TEST")")
        }
        .onAppear {
            trainings = CoreDataManager().getAllTrainings()
        }
    }
    
}

struct ExampleView_Previews: PreviewProvider {
    static var previews: some View {
        ExampleView()
    }
}
