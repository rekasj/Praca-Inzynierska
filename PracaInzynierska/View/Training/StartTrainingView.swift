//
//  ExercisePreviewView.swift
//  PracaInzynierska
//
//  Created by Jakub Rękas on 07/01/2022.
//

import SwiftUI

struct StartTrainingView: View {
    @State private var title: String = ""
    @State private var isPresented: Bool = false
    
    var body: some View {
        VStack {
            TextField("Training title...", text: $title)
            Button("Start training") {
                self.isPresented = true
            }.sheet(isPresented: self.$isPresented, onDismiss: {
                isPresented = false
            }) {
                ExerciseView(trainingTitle: title)
            }
        }
    }
}

struct StartTrainingView_Previews: PreviewProvider {
    static var previews: some View {
        StartTrainingView()
    }
}
