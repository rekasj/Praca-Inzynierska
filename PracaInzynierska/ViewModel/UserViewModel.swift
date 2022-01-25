//
//  UserViewModel.swift
//  PracaInzynierska
//
//  Created by Jakub Rękas on 30/10/2021.
//

import Foundation
import Firebase

class UserViewModel: ObservableObject {
   
    let auth = Auth.auth()
    
    func isSignedIn() -> Bool {
        return auth.currentUser != nil
    }
    
    func signIn(email: String, password: String){
        auth.signIn(withEmail: email, password: password) { result, error in
            guard result != nil, error == nil else {
                return
            }
            // SUKCES
            
         }
    }
    func signUp(email: String, password: String){
        auth.createUser(withEmail: email, password: password) { result, error in
            guard result != nil, error == nil else {
                return
                
            }
            // SUKCES
         }
    }
}
