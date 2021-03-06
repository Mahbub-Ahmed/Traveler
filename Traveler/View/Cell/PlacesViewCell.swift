//
//  PlacesViewCell.swift
//  Traveler
//
//  Created by Mahbub  Ahmed on 7/22/20.
//  Copyright © 2020 Mahbub  Ahmed. All rights reserved.
//

import UIKit

class PlacesViewCell: UICollectionViewCell {
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var overlayView: UIView!

    static let identifier = String(describing: PlacesViewCell.self)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupConstraint()
        setupCornerRadius()
    }
    
    // MARK: Private methods
    func setupConstraint() {
        image.translatesAutoresizingMaskIntoConstraints = false
        
        image.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        image.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        image.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
    
    func setupCornerRadius() {
        image.layer.cornerRadius = 10
        overlayView.layer.cornerRadius = 10
        image.clipsToBounds = true
        overlayView.clipsToBounds = true
        setupConstraint()
    }
}
