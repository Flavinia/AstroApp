//
//  Answer.swift
//  AstroApp
//
//  Created by Alexandru Vladut on 20/05/2018.
//  Copyright © 2018 Alexandru Vladut. All rights reserved.
//

import Foundation
import ObjectMapper

class Answer:Mappable {
    
    var text:String?
    var points:Int = 0
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        text <- map["text"]
        points <- map["points"]
    }
    
    
}
