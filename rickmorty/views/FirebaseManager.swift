//
//  FirebaseManager.swift
//  rickmorty
//
//  Created by Antonio Gabriel Marín on 20/08/2019.
//  Copyright © 2019 Antonio. All rights reserved.
//

import Foundation
import FirebaseAuth

class FirebaseManager {
    
    func createUser(username: String, password: String, completion: @escaping (_ result: AuthDataResult?, _ error: Error?) -> Void) {
        
        //la funcion createUser viene definida por defecto por firebase, y es la que nos va a comprobar si se puede o no crear el usuario en la base de datos de firebase
        Auth.auth().createUser(withEmail: username, password: password) { (result, error) in
            if error != nil {
                completion(nil, error)
            }
            else {
                completion(result, nil)
            }
        }
    }
    
    func loginUser(username: String, password: String, completion: @escaping (_ result: AuthDataResult?, _ error: Error?) -> Void) {
        
        //la funcion signIn viene definida por defecto por firebase, y es la que nos va a comprobar si se puede o no logear el usuario en la base de datos de firebase
        Auth.auth().signIn(withEmail: username, password: password) {
            (result, error) in
            if error != nil {
                completion(nil, error)
            }
            else {
                completion(result, nil)
            }
        }
    }
    
}
