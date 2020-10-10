//
//  LocationsViewCell.swift
//  hotmart
//
//  Created by Wellysson Avelar on 10/10/20.
//  Copyright © 2020 Wellysson Avelar. All rights reserved.
//

import UIKit

class LocationsViewCell: UICollectionViewCell {
    
    @IBOutlet weak var contentainerView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var star1ImageView: UIImageView!
    @IBOutlet weak var star2ImageView: UIImageView!
    @IBOutlet weak var star3ImageView: UIImageView!
    @IBOutlet weak var star4ImageView: UIImageView!
    @IBOutlet weak var star5ImageView: UIImageView!
    
    @IBOutlet weak var cellWidth: NSLayoutConstraint!
    
   static let identifier = "LocationsViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    public func configure(image: UIImage?, name: String, type: String, review: Double, width: CGFloat) {
        self.cellWidth.constant =  width
        self.imageView.image = image
        self.nameLabel.text = name
        self.typeLabel.text = type
        self.setStars(review: review)
    }
    
    private func setStars(review: Double) {
        self.star1ImageView.image = UIImage(named: "small_star_off")
        self.star2ImageView.image = UIImage(named: "small_star_off")
        self.star3ImageView.image = UIImage(named: "small_star_off")
        self.star4ImageView.image = UIImage(named: "small_star_off")
        self.star5ImageView.image = UIImage(named: "small_star_off")
        
        if review > 4.5 {
            self.star1ImageView.image = UIImage(named: "small_star_on")
            self.star2ImageView.image = UIImage(named: "small_star_on")
            self.star3ImageView.image = UIImage(named: "small_star_on")
            self.star4ImageView.image = UIImage(named: "small_star_on")
            self.star5ImageView.image = UIImage(named: "small_star_on")
        } else if review > 3.5 {
            self.star1ImageView.image = UIImage(named: "small_star_on")
            self.star2ImageView.image = UIImage(named: "small_star_on")
            self.star3ImageView.image = UIImage(named: "small_star_on")
            self.star4ImageView.image = UIImage(named: "small_star_on")
        } else if review > 2.5 {
            self.star1ImageView.image = UIImage(named: "small_star_on")
            self.star2ImageView.image = UIImage(named: "small_star_on")
            self.star3ImageView.image = UIImage(named: "small_star_on")
        } else if review > 1.5 {
            self.star1ImageView.image = UIImage(named: "small_star_on")
            self.star2ImageView.image = UIImage(named: "small_star_on")
        } else if review > 0.1 {
            self.star1ImageView.image = UIImage(named: "small_star_on")
        }
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "LocationsViewCell", bundle: nil)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.contentainerView.layer.cornerRadius = 16
    }
}
