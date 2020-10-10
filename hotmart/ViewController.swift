//
//  ViewController.swift
//  hotmart
//
//  Created by Wellysson Avelar on 10/10/20.
//  Copyright © 2020 Wellysson Avelar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.fillContent()
    }


    private func fillContent() {
        LocationService.getLocationDetail(id: 1, completion: { [weak self] location in
            guard let self = self else { return }
            
            print(location?.about)
        })
        
//        LocationService.getLocations(completion: { [weak self] locations in
//            guard let self = self else { return }
//            
//            print(locations.count)
//        })
    }
}

