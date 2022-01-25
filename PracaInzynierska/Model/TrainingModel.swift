//
//  TraningModel.swift
//  PracaInzynierska
//
//  Created by Jakub Rękas on 24/01/2022.
//

import Foundation

struct TrainingModel {
    var id = UUID()
    var title: String?
    var date: Date?
    var exercises: [ExerciseSec]?
    
    init(title: String? = nil, date: Date? = nil, exercises: [ExerciseSec]? = nil) {
        self.title = title
        self.date = date
        self.exercises = exercises
    }
}

struct ExerciseSec {
    var name: String?
    var type: String?
    var set: [OneSet]?
    
    init(name: String? = nil, type: String? = nil, set: [OneSet]? = nil){
        self.name = name
        self.type = type
        self.set = set
    }
}

struct OneSet {
    var result: Float?
    
    init(result: Float? = nil){
        self.result = result
    }
}
