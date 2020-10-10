//
//  LocationDetail.swift
//  hotmart
//
//  Created by Wellysson Avelar on 10/10/20.
//  Copyright © 2020 Wellysson Avelar. All rights reserved.
//

import Foundation
import ObjectMapper

class LocationDetail: Mappable {
    var id: Int?
    var name: String?
    var review: Double?
    var type: String?
    var about: String?
    var phone: String?
    var adress: String?
    var schedule: [Schedules]?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        self.id <- map["id"]
        self.name <- map["name"]
        self.review <- map["review"]
        self.type <- map["type"]
        self.about <- map["about"]
        self.phone <- map["phone"]
        self.adress <- map["adress"]
        self.schedule <- map["schedule"]
    }
}
