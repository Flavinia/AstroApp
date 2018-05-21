//
//  Test.swift
//  AstroApp
//
//  Created by Alexandru Vladut on 20/05/2018.
//  Copyright © 2018 Alexandru Vladut. All rights reserved.
//

import Foundation
import ObjectMapper

class Test:Mappable {
    var name:String?
    var desc:String?
    var questions:[Question] = []
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        name <- map["name"]
        desc <- map["desc"]
        questions <- map["questions"]
    }
    
}


