//
//  DatabaseManager.swift
//  AstroApp
//
//  Created by Alexandru Vladut on 20/05/2018.
//  Copyright © 2018 Alexandru Vladut. All rights reserved.
//

import Foundation
import Firebase
import ObjectMapper

class DatabaseManager {
    
    private var ref: DatabaseReference!
    static let sharedInstance = DatabaseManager()
    
    private init () {
        ref = Database.database().reference()
    }
    
    func getTestsForLevel (_ level:Int, completion:@escaping (Any)-> Void) {
        ref.child("lvl1").observeSingleEvent(of: .value, with: { (snapshot) in
            //print ("answer snapshot : \(snapshot.value!)")
            let dictValue = snapshot.value as? [String:Any]
            if let value = dictValue!["tests"]  {
                completion(value)
            }
           
            
        })
    }
    
}
