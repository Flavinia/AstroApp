//
//  TestListTableViewModel.swift
//  AstroApp
//
//  Created by Alexandru Vladut on 21/05/2018.
//  Copyright © 2018 Alexandru Vladut. All rights reserved.
//

import Foundation
import ObjectMapper


class TestListTableViewModel {
    
    var tests:[Test] = []
    weak var delegate:TableViewModelDelegate?
    
    func getTestsForLevel(_ level:Int) -> [Test] {
        DatabaseManager.sharedInstance.getTestsForLevel(1) { (response) in
            print ("\(response)")
            if let newTestsResponse = Mapper<Test>().mapArray(JSONObject: response) {
                self.tests = newTestsResponse
                self.delegate?.testsUpdated()
            }
            print ("\(self.tests)")
        }
        return []
    }
}
