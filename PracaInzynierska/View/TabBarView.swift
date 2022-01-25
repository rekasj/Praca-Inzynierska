//
//  TabBarView.swift
//  PracaInzynierska
//
//  Created by Jakub Rękas on 03/01/2022.
//

import SwiftUI

struct TabBarView: View {
    @State private var selectedItem = 2
    
    init(){
        UITabBar.appearance().isTranslucent = true
        UITabBar.appearance().unselectedItemTintColor = UIColor(.gray)
        UITabBar.appearance().barTintColor = UIColor(Colors().counterColor)
        UITabBar.appearance().backgroundColor = UIColor(Colors().mainColor)
        UINavigationBar.appearance().tintColor = UIColor(Colors().mainColor)
    }
    
    
    var body: some View {
        TabView(selection: $selectedItem) {
            StartTrainingView()
                .tabItem {
                    Image(systemName: "pencil")
                }
                .tag(1)
            MainView()
                .tabItem {
                    Image(systemName: "house")
                }
                .tag(2)
            SearchDrillView(selectedDrill: .constant(Exercise(id: UUID(), name: String(), type: "forTime")), isPresented: .constant(false))
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
                .tag(3)
        }
        .accentColor(Colors().counterColor)
        .ignoresSafeArea()
        .onAppear(perform: {
            UITextField.appearance().keyboardAppearance = UIKeyboardAppearance.dark
        })
    }
}

extension View {
    func dismissKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
