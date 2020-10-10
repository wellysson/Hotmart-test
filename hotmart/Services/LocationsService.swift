//
//  LocationsService.swift
//  hotmart
//
//  Created by Wellysson Avelar on 10/10/20.
//  Copyright © 2020 Wellysson Avelar. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

class LocationService {
    static var urlBase = "https://hotmart-mobile-app.herokuapp.com/locations"
    
    static func getLocations(completion: @escaping ([Location])->()) {
        Alamofire.request(self.urlBase).responseJSON { response in
            
            if let json = response.result.value as? [String: Any] {
                if let locations = Mapper<Location>().mapArray(JSONObject: json["listLocations"]) {
                    completion(locations)
                }
            } else {
                let locations = [Location]()
                completion(locations)
            }
        }
    }
    
    static func getLocationDetail(id: Int, completion: @escaping (LocationDetail?)->()) {
        let url = "\(self.urlBase)/\(id)"
        
        Alamofire.request(url).responseJSON { response in
            
            if let json = response.result.value as? [String: Any] {
                if let locationDetail = Mapper<LocationDetail>().map(JSON: json) {
                    print(locationDetail)
                }
            } else {
                completion(nil)
            }
        }
    }
}
