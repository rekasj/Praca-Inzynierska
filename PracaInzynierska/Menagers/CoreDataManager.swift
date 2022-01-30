//
//  CoreDataManager.swift
//  PracaInzynierska
//
//  Created by Jakub Rękas on 25/01/2022.
//

import CoreData
import Foundation

class CoreDataManager {
    
    let persistentContainer: NSPersistentContainer
    
    init() {
        persistentContainer = NSPersistentContainer(name: "TrainingCDModel")
        persistentContainer.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError("Core Data Store failed \(error.localizedDescription)")
            }
            if self.getDrills().isEmpty {
                for i in Drills().drills {
                    self.saveDrill(drillModel: i)
                }
            }
        }
    }
    
    func getAllTrainings() -> [TrainingDataModel] {
        let fetchRequest: NSFetchRequest<TrainingDataModel> = TrainingDataModel.fetchRequest()
        
        do {
            return try persistentContainer.viewContext.fetch(fetchRequest)
        } catch {
            return []
        }
    }
    
    func getExercises() -> [ExerciseDataModel] {
        let fetchRequest: NSFetchRequest<ExerciseDataModel> = ExerciseDataModel.fetchRequest()
        
        do {
            return try persistentContainer.viewContext.fetch(fetchRequest)
        } catch {
            return []
        }
    }
    
    func getSets() -> [SetsDataModel] {
        let fetchRequest: NSFetchRequest<SetsDataModel> = SetsDataModel.fetchRequest()
        
        do {
            return try persistentContainer.viewContext.fetch(fetchRequest)
        } catch {
            return []
        }
    }
    
    func getDrills() -> [DrillDataModel] {
        let fetchRequest: NSFetchRequest<DrillDataModel> = DrillDataModel.fetchRequest()
        
        do {
            return try persistentContainer.viewContext.fetch(fetchRequest)
        } catch {
            return []
        }
    }
    
    func saveDrill(drillModel: Exercise) {
        let drillDataModel = DrillDataModel(context: persistentContainer.viewContext)
        
        drillDataModel.id = drillModel.id
        drillDataModel.name = drillModel.name
        drillDataModel.type = drillModel.type
        
        do {
            try persistentContainer.viewContext.save()
        } catch {
            print("Failed \(error)")
        }
    }
    
    func saveTraining(trainingModel: TrainingModel) {
        let trainingDataModel = TrainingDataModel(context: persistentContainer.viewContext)
        
        trainingDataModel.id = trainingModel.id
        trainingDataModel.title = trainingModel.title
        trainingDataModel.date = trainingModel.date
        
        if let exercises = trainingModel.exercises {
            for exercise in exercises {
                saveExercise(training: trainingModel, exercise: exercise)
            }
        }
        
        do {
            try persistentContainer.viewContext.save()
        } catch {
            print("Failed \(error)")
        }
    }
    
    private func saveExercise(training: TrainingModel,exercise: ExerciseSec) {
        let exerciseDataModel = ExerciseDataModel(context: persistentContainer.viewContext)
        
        exerciseDataModel.id = UUID()
        exerciseDataModel.name = exercise.name
        exerciseDataModel.type = "type"
        exerciseDataModel.trainingid = training.id
        
        if let sets = exercise.set {
            for oneSet in sets {
                saveSets(exercise: exerciseDataModel, set: oneSet)
            }
        }
        
        do {
            try persistentContainer.viewContext.save()
        } catch {
            print("Failed \(error)")
        }
    }
    
    private func saveSets(exercise: ExerciseDataModel, set: OneSet) {
        let setsDataModel = SetsDataModel(context: persistentContainer.viewContext)
        
        setsDataModel.id = UUID()
        setsDataModel.result = set.result ?? 0
        setsDataModel.exerciseid = exercise.id
        
        do {
            try persistentContainer.viewContext.save()
        } catch {
            print("Failed \(error)")
        }
    }
}
