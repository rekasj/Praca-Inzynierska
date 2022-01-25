//
//  DrillsModel.swift
//  PracaInzynierska
//
//  Created by Jakub Rękas on 11/12/2021.
//

import Foundation

struct Drills{
    var drills = [
        Exercise(id: UUID(), name: " Własny", type: "forTime"),
        Exercise(id: UUID(), name: "P.C.Z - 25m", type: "forPoints"),
        Exercise(id: UUID(), name: "Bill Drill", type: "forTime"),
        Exercise(id: UUID(), name: "Training Drills", type: "forFocus"),
        Exercise(id: UUID(), name: "El presidente", type: "forTime"),
        Exercise(id: UUID(), name: "The-Vice Presidente", type: "forTime"),
        Exercise(id: UUID(), name: "The Demi Presidente", type: "forTime"),
        Exercise(id: UUID(), name: "Assorted Drills", type: "forTime"),
        Exercise(id: UUID(), name: "Tueller Drill", type: "forTime"),
        Exercise(id: UUID(), name: "Timed Fire Practice Drill", type: "forTime"),
        Exercise(id: UUID(), name: "Consecutive Pairs", type: "forTime")
    ]
}
