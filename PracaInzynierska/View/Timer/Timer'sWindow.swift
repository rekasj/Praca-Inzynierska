//
//  Timer'sWindow.swift
//  PracaInzynierska
//
//  Created by Jakub Rękas on 26/11/2021.
//

import SwiftUI



struct Timer_sWindow: View {
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(.white)
            
            Rectangle()
                .foregroundColor(.red)
                .frame(width: 34, height: 5, alignment: .center)
                .offset(x: 0, y: -45)
            HStack{
                Rectangle()
                    .foregroundColor(.red)
                    .frame(width: 5, height: 34, alignment: .center)
                    .offset(x: -8, y: -22)
                Rectangle()
                    .foregroundColor(.red)
                    .frame(width: 5, height: 34, alignment: .center)
                    .offset(x: 8, y: -22)
            }
            Rectangle()
                .foregroundColor(.red)
                .frame(width: 34, height: 5, alignment: .center)
                .offset(x: 0, y: 0)
            HStack{
                Rectangle()
                    .foregroundColor(.red)
                    .frame(width: 5, height: 34, alignment: .center)
                    .offset(x: -8, y: 22)
                Rectangle()
                    .foregroundColor(.red)
                    .frame(width: 5, height: 34, alignment: .center)
                    .offset(x: 8, y: 22)
            }
            Rectangle()
                .foregroundColor(.red)
                .frame(width: 34, height: 5, alignment: .center)
                .offset(x: 0, y: 45)
        }
    }
}

struct Timer_sWindow_Previews: PreviewProvider {
    static var previews: some View {
        Timer_sWindow().previewLayout(.fixed(width: 45, height: 100))
    }
}
