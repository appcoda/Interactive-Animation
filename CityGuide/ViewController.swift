//
//  ViewController.swift
//  CityGuide
//
//  Created by Evgenii Trapeznikov on 1/13/19.
//  Copyright © 2019 Evgenii Trapeznikov. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    fileprivate let items: [City] = City.buildCities()
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.collectionViewLayout = CityCollectionViewFlowLayout(itemSize: CityCollectionViewCell.cellSize);
        collectionView.decelerationRate = UIScrollView.DecelerationRate.fast
    }
}

// MARK: UICollectionViewDataSource

extension ViewController {
    
    func collectionView(_: UICollectionView, numberOfItemsInSection _: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CityCollectionViewCell.identifier, for: indexPath) as! CityCollectionViewCell
        cell.configure(with: items[indexPath.item], collectionView: collectionView, index: indexPath.row)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedCell = collectionView.cellForItem(at: indexPath)! as! CityCollectionViewCell
        selectedCell.toggle()
    }
}

