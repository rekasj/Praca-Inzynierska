//
//  TrainingManager.swift
//  PracaInzynierska
//
//  Created by Jakub Rękas on 24/01/2022.
//

import Foundation

class TrainingManager {
    
    var list: [TrainingModel] = [TrainingModel]()
    var temp: TrainingModel = TrainingModel()
    
    static var shared: TrainingManager = {
        let instance = TrainingManager()
        
        return instance
    }()
    
    private init() {
        
    }
    
    func buildTraining(title: String, date: Date) {
        temp = TrainingModel()
        temp.title = title
        temp.date = date
        temp.exercises = []
    }
    
    func addExercise(name: String, type: String) {
        var tempExercise = ExerciseSec()
        tempExercise.name = name
        tempExercise.type = type
        tempExercise.set = []
        
        
        temp.exercises?.append(tempExercise)
    }
    
    func addSet(result: Float, exerciseIndex: Int) {
        var tempOneSet = OneSet()
        tempOneSet.result = result
        
        temp.exercises?[exerciseIndex].set?.append(tempOneSet)
    }
    
    func updataSet(result: Float, exerciseIndex: Int, setIndex: Int) {
        temp.exercises?[exerciseIndex].set?[setIndex].result = result
        
    }
    
    func saveTraining() {
        list.append(temp)
    }

}
