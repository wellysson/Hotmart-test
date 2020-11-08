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
        
        if self.schedule == nil {
            var single: Schedules?
            single <- map["schedule"]
            if let schedule = single {
                self.schedule = [Schedules]()
                self.schedule?.append(schedule)
            }
        }
    }
    
    public func getWorkingDaysTimes() -> String? {
        if let item = self.schedule?.first {
            let list: [Schedule?] = [item.monday, item.tuesday, item.wednesday, item.thursday, item.friday]
            
            var returnValue = ""
            if let item = list.first(where: {$0 != nil} ), let open = item?.open, let close = item?.close {
                returnValue = "seg a sex: \(open) às \(close)"
            }
            
            return returnValue
        }
        
        return nil
    }
    
    public func getWeekendTimes() -> String? {
        if let item = self.schedule?.first {
            let list: [Schedule?] = [item.saturday, item.saturday]
            
            var returnValue = ""
            if let item = list.first(where: {$0 != nil} ), let open = item?.open, let close = item?.close {
                returnValue = "sáb e dom: \(open) às \(close)"
            }
            
            return returnValue
        }
        
        return nil
    }
}
