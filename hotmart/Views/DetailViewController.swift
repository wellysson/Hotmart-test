//
//  DetailViewController.swift
//  hotmart
//
//  Created by Wellysson Avelar on 10/10/20.
//  Copyright © 2020 Wellysson Avelar. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var topImageView: UIImageView!
    @IBOutlet weak var locationNameLabel: UILabel!
    @IBOutlet weak var star1ImageView: UIImageView!
    @IBOutlet weak var star2ImageView: UIImageView!
    @IBOutlet weak var star3ImageView: UIImageView!
    @IBOutlet weak var star4ImageView: UIImageView!
    @IBOutlet weak var star5ImageView: UIImageView!
    @IBOutlet weak var starValueLabel: UILabel!
    @IBOutlet weak var aboutDescriptionLanel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var workingTimesLabel: UILabel!
    
    var locationDetail: LocationDetail?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = true

        self.fillContent()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    private func fillContent() {
        self.loadTopImage()
        self.locationNameLabel.text = self.locationDetail?.name
        self.setStars()
        self.aboutDescriptionLanel.text = self.locationDetail?.about
        self.setSchedule()
        self.phoneLabel.text = self.locationDetail?.phone
        self.addressLabel.text = self.locationDetail?.adress
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func shareButton(_ sender: Any) {
    }
    
}

//Flow
extension DetailViewController {
    
    private func loadTopImage() {
        //TODO: Implementação com mock de como ficaria caso o serviço retore propriedade url
        let url = "https://diariodorio.com/wp-content/uploads/2020/05/Abrasel-RJ-cartilha-traz-orienta%C3%A7%C3%B5es-para-reabertura.jpg"
        if let image = MyVariables.imageCache.image(withIdentifier: url) {
            self.topImageView.image = image
        } else {
            LocationService.getPhoto(url: url) { [weak self] image in
                guard let self = self else { return }
                
                MyVariables.imageCache.add(image, withIdentifier: url)
                
                DispatchQueue.main.async {
                    self.topImageView.image = image
                }
            }
        }
        //Fim
    }
    
    private func setSchedule() {
        var times = ""
        
        if let time = self.locationDetail?.getWorkingDaysTimes() {
            times = time
        }
        
        if let time = self.locationDetail?.getWeekendTimes() {
            if times.count > 0 {
                times += "\n\(time)"
            } else {
                times = time
            }
        }
        
        self.workingTimesLabel.text = times
    }
    
    private func setStars() {
        let review = self.locationDetail?.review ?? 0
        
        self.starValueLabel.text = String(review)
        
        self.star1ImageView.image = UIImage(named: "star_off")
        self.star2ImageView.image = UIImage(named: "star_off")
        self.star3ImageView.image = UIImage(named: "star_off")
        self.star4ImageView.image = UIImage(named: "star_off")
        self.star5ImageView.image = UIImage(named: "star_off")
        
        if review > 4.5 {
            self.star1ImageView.image = UIImage(named: "star_on")
            self.star2ImageView.image = UIImage(named: "star_on")
            self.star3ImageView.image = UIImage(named: "star_on")
            self.star4ImageView.image = UIImage(named: "star_on")
            self.star5ImageView.image = UIImage(named: "star_on")
        } else if review > 3.5 {
            self.star1ImageView.image = UIImage(named: "star_on")
            self.star2ImageView.image = UIImage(named: "star_on")
            self.star3ImageView.image = UIImage(named: "star_on")
            self.star4ImageView.image = UIImage(named: "star_on")
        } else if review > 2.5 {
            self.star1ImageView.image = UIImage(named: "star_on")
            self.star2ImageView.image = UIImage(named: "star_on")
            self.star3ImageView.image = UIImage(named: "star_on")
        } else if review > 1.5 {
            self.star1ImageView.image = UIImage(named: "star_on")
            self.star2ImageView.image = UIImage(named: "star_on")
        } else if review > 0.1 {
            self.star1ImageView.image = UIImage(named: "star_on")
        }
    }
    
    
}
