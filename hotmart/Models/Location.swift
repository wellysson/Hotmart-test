//
//  Location.swift
//  hotmart
//
//  Created by Wellysson Avelar on 10/10/20.
//  Copyright © 2020 Wellysson Avelar. All rights reserved.
//

import Foundation
import ObjectMapper

class Location: Mappable {
    var id: Int?
    var name: String?
    var review: Double?
    var type: String?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        self.id <- map["id"]
        self.name <- map["name"]
        self.review <- map["review"]
        self.type <- map["type"]
    }
}
