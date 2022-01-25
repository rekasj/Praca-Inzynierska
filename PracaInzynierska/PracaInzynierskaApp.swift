//
//  PracaInzynierskaApp.swift
//  PracaInzynierska
//
//  Created by Jakub Rękas on 27/10/2021.
//

import SwiftUI
import CoreData

@main
struct PracaInzynierskaApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    
    
    var body: some Scene {
        
        WindowGroup {
            TabBarView()
        }
    }
    
    class AppDelegate: NSObject, UIApplicationDelegate {
        func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
            
            
            return true
        }
    }
}

