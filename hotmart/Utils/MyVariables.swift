//
//  MyVariables.swift
//  hotmart
//
//  Created by Wellysson Avelar on 10/10/20.
//  Copyright © 2020 Wellysson Avelar. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireImage

struct MyVariables {
    static let imageCache = AutoPurgingImageCache(memoryCapacity: 50000000, preferredMemoryUsageAfterPurge: 10000000)
}
