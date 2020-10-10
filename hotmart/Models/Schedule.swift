//
//  Schedule.swift
//  hotmart
//
//  Created by Wellysson Avelar on 10/10/20.
//  Copyright © 2020 Wellysson Avelar. All rights reserved.
//

import Foundation
import ObjectMapper

class Schedule: Mappable {
    var open: String?
    var close: String?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        self.open <- map["open"]
        self.close <- map["close"]
    }
}
