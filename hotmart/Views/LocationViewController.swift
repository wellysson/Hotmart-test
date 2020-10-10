//
//  LocationViewController.swift
//  hotmart
//
//  Created by Wellysson Avelar on 10/10/20.
//  Copyright © 2020 Wellysson Avelar. All rights reserved.
//

import UIKit

class LocationViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var locations = [Location]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.register(LocationsViewCell.nib(), forCellWithReuseIdentifier: LocationsViewCell.identifier)
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        self.fillContent()
    }
    
    let reuseIdentifier = "cell" // also enter this string as the cell identifier in the storyboard
    var items = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48"]


    private func fillContent() {
        
        self.getLocations()
    }
}

extension LocationViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.locations.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: LocationsViewCell.identifier, for: indexPath) as! LocationsViewCell
        
        let location = locations[indexPath.row]
        cell.configure(image: nil, name: location.name ?? "", type: location.type ?? "", review: location.review ?? 0)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.collectionView.deselectItem(at: indexPath, animated: true)
        
        if let id = locations[indexPath.row].id {
            self.getLocationDetail(id: id)
        }
    }
}

//Services
extension LocationViewController {
    private func getLocations() {
        self.view.showBlurLoader()
        LocationService.getLocations(completion: { [weak self] locations in
            guard let self = self else { return }
            
            self.locations = locations
            self.collectionView.reloadData()
            self.view.removeBluerLoader()
        })
    }
    
    private func getLocationDetail(id: Int) {
        self.view.showBlurLoader()
        LocationService.getLocationDetail(id: id, completion: { [weak self] location in
            guard let self = self else { return }
            
            self.view.removeBluerLoader()
        })
    }
}
