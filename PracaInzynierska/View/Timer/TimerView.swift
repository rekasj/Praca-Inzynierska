//
//  TimerView.swift
//  PracaInzynierska
//
//  Created by Jakub Rękas on 26/11/2021.
//

import SwiftUI




struct TimerView: View {
    
    @State private var buttonValue: String = "Start"
    @State private var buttonColor: Color = .green
    
    
    struct Times: Identifiable {
        let time: String
        var id = UUID()
    }
    
    private var timesTable = [
        Times(time: "00:01:23"),
        Times(time: "00:02:58"),
        Times(time: "00:09:18"),
        Times(time: "00:15:21")
    
    ]
    
    
    var body: some View {
        VStack{
            HStack{
                Spacer()
                HStack{
                    Timer_sWindow()
                    Timer_sWindow()
                }.padding()
                HStack{
                    Timer_sWindow()
                    Timer_sWindow()
                }.padding()
                HStack{
                    Timer_sWindow()
                    Timer_sWindow()
                }.padding()
            }
            
            List(timesTable){
                Text($0.time)
            }
            Button(action: {
                if buttonValue == "Start" {
                    buttonValue = "Stop"
                    buttonColor = .red
                    
                } else {
                    buttonValue = "Start"
                    buttonColor = .green
                    
                }
            }, label: {
                Text(buttonValue)
                    .frame(width: 200, height: 50)
                    .foregroundColor(Color.black)
                    .background(buttonColor)
                    .cornerRadius(20)
            })
        }
    }
}


struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TimerView()
        }
    }
}
