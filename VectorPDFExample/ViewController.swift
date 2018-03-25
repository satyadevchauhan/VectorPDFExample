//
//  ViewController.swift
//  VectorPDFExample
//
//  Created by Satyadev on 25/03/18.
//  Copyright © 2018 Satyadev Chauhan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var slider: UISlider!
    
    var dataSource: [UIImage] = [#imageLiteral(resourceName: "ascendant"), #imageLiteral(resourceName: "basket"), #imageLiteral(resourceName: "business_m"), #imageLiteral(resourceName: "business_w"), #imageLiteral(resourceName: "circular"), #imageLiteral(resourceName: "dollar"), #imageLiteral(resourceName: "facebook"), #imageLiteral(resourceName: "film"), #imageLiteral(resourceName: "folder"), #imageLiteral(resourceName: "gear"), #imageLiteral(resourceName: "images"), #imageLiteral(resourceName: "line"), #imageLiteral(resourceName: "lock"), #imageLiteral(resourceName: "magnifier"), #imageLiteral(resourceName: "mail"), #imageLiteral(resourceName: "map"), #imageLiteral(resourceName: "note"), #imageLiteral(resourceName: "pencil"), #imageLiteral(resourceName: "phone"), #imageLiteral(resourceName: "photo"), #imageLiteral(resourceName: "redo"), #imageLiteral(resourceName: "sharethis"), #imageLiteral(resourceName: "twitter"), #imageLiteral(resourceName: "watch"), #imageLiteral(resourceName: "youtube")]
    var cellSizeMultiplier: CGFloat = 1.0
    
    static let ImageCollectionViewCellReuseIdentifier = "ImageCollectionViewCell"
    
    var isLandscape:Bool {
        get {
            return UIApplication.shared.statusBarOrientation.isLandscape
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.title = "Vector PDF Images"
        
        // Register for CollectionView delegates
        self.collectionView.delegate = self;
        self.collectionView.dataSource = self;
        
        self.slider.minimumValue = 1
        self.slider.maximumValue = self.isLandscape ? 14 : 7
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        print("Value: \(sender.value)")
        self.cellSizeMultiplier = CGFloat(sender.value)
        self.collectionView.reloadData()
    }
}

// MARK: UICollectionViewDelegate

extension ViewController: UICollectionViewDelegate {
    
}

// MARK: UICollectionViewDataSource

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let collectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: ViewController.ImageCollectionViewCellReuseIdentifier, for: indexPath) as! ImageCollectionViewCell
        
        collectionCell.imageView.image = dataSource[indexPath.row]
        
        return collectionCell
    }
    
}

// MARK: UICollectionViewDelegateFlowLayout

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 50.0 * self.cellSizeMultiplier, height: 50.0 * self.cellSizeMultiplier)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.init(top: 10, left: 10, bottom: 10, right: 10)
    }
}

