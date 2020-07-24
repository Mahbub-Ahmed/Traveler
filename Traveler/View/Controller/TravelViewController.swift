//
//  HomeViewController.swift
//  Traveler
//
//  Created by Mahbub  Ahmed on 7/20/20.
//  Copyright © 2020 Mahbub  Ahmed. All rights reserved.
//

import UIKit

class TravelViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        collectionView.register(UINib(nibName: PlacesViewCell.identifier, bundle: nil),
        forCellWithReuseIdentifier: PlacesViewCell.identifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
    }
}

// MARK: - UICollectionViewDataSource
extension TravelViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PlacesViewCell.identifier, for: indexPath) as? PlacesViewCell {
            return cell
        }
        return UICollectionViewCell()
    }
}



// MARK: UICollectionViewDelegateFlowLayout
extension TravelViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let safeAreaWidth = view.safeAreaInsets.left + view.safeAreaInsets.right + 50
        let size = (view.frame.width - safeAreaWidth)/2
        return CGSize(width: size, height: size)
    }
}
