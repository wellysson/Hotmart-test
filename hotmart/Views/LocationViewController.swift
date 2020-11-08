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
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    private func fillContent() {
        
        self.getLocations()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail", let locationDetail = sender as? LocationDetail {
            if let controller = (segue.destination as? DetailViewController) {
                controller.locationDetail = locationDetail
            }
        }
    }
}

extension LocationViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.locations.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: LocationsViewCell.identifier, for: indexPath) as! LocationsViewCell
        
        let location = locations[indexPath.row]
        let width = self.getCellWidth()
        cell.configure(image: nil, name: location.name ?? "", type: location.type ?? "", review: location.review ?? 0, width: width)
        
        //TODO: Implementação com mock de como ficaria caso o serviço retore propriedade url
        let url = "https://media-cdn.tripadvisor.com/media/photo-s/19/a4/6c/82/dining-and-bar-area.jpg"
        if let image = MyVariables.imageCache.image(withIdentifier: url) {
            cell.image = image
        } else {
            LocationService.getPhoto(url: url) { image in
                
                MyVariables.imageCache.add(image, withIdentifier: url)
                
                DispatchQueue.main.async {
                    cell.image = image
                }
            }
        }
        //Fim
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.collectionView.deselectItem(at: indexPath, animated: true)
        
        if let id = locations[indexPath.row].id {
            self.getLocationDetail(id: id)
        }
    }
}

//Flow
extension LocationViewController {
    
    private func getCellWidth() -> CGFloat {
        let width = (self.collectionView.frame.width / 2) - 8
        return width
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
        LocationService.getLocationDetail(id: id, completion: { [weak self] locationDetail in
            guard let self = self else { return }
            
            self.view.removeBluerLoader()
            self.performSegue(withIdentifier: "showDetail", sender: locationDetail)
        })
    }
}
