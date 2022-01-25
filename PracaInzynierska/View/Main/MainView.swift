//
//  MainView.swift
//  PracaInzynierska
//
//  Created by Jakub Rękas on 08/01/2022.
//

import SwiftUI

struct MainView: View {
    @State private var selectedItem = 0
    
    var body: some View {
        NavigationView {
            List(results) { result in
                NavigationLink(destination: TrainingPreView(training: result)) {
                    MainViewCell(person: result)
                }
            }
            .navigationBarTitle("Trainings")
        }
        
    }
    
    var results: [TrainingCellData] {
        var tempArray = [TrainingCellData]()
        var trainings: [TrainingDataModel] = [TrainingDataModel]()
        
        trainings = CoreDataManager().getAllTrainings()
        
        for training in trainings {
            tempArray.append(TrainingCellData(id: training.id ?? UUID(),
                                              trainingName: training.title ?? "TEST",
                                              date: training.date ?? Date()))
        }
        
        return tempArray
    }
    
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
