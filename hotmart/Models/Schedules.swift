//
//  Schedules.swift
//  hotmart
//
//  Created by Wellysson Avelar on 10/10/20.
//  Copyright © 2020 Wellysson Avelar. All rights reserved.
//

import Foundation
import ObjectMapper

class Schedules: Mappable {
    var monday: Schedule?
    var tuesday: Schedule?
    var wednesday: Schedule?
    var thursday: Schedule?
    var friday: Schedule?
    var saturday: Schedule?
    var sunday: Schedule?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        self.monday <- map["monday"]
        self.tuesday <- map["tuesday"]
        self.wednesday <- map["wednesday"]
        self.thursday <- map["thursday"]
        self.friday <- map["friday"]
        self.saturday <- map["saturday"]
        self.sunday <- map["sunday"]
    }
}
