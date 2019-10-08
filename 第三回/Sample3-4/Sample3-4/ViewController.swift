//
//  ViewController.swift
//  Sample3-4
//
//  Created by 新納真次郎 on 2019/10/08.
//  Copyright © 2019 新納真次郎. All rights reserved.
//

import UIKit
import Photos

class ViewController: UIViewController {
  
    var images: [UIImage] = []
    
    @IBOutlet weak var collectionV: UICollectionView!
    var cellSize = CGSize(width: 200, height: 200)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeCollectionV()
        getAllPhotos()
    }
    
    func initializeCollectionV(){
        let nib = UINib(nibName: "MyCell", bundle: Bundle.main)
        collectionV.register(nib, forCellWithReuseIdentifier: "MyCell")
        collectionV.delegate   = self
        collectionV.dataSource = self
        
        let margin: CGFloat = 1.0
        let width = collectionV.bounds.width / 3 - margin * 4.0
        let height = collectionV.bounds.width / 3 - margin * 4.0
        cellSize = CGSize(width: width, height: height)
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: margin, left: margin, bottom: margin, right: margin)
        collectionV.collectionViewLayout = layout
        
    }
    
    func getAllPhotos() {
        let manager = PHImageManager.default()
        let assets: PHFetchResult = PHAsset.fetchAssets(with: .image, options: nil)
        assets.enumerateObjects({ [weak self] (asset, index, stop) -> Void in
            guard let wself = self else {
                return
            }
            manager.requestImage(for: asset, targetSize: wself.cellSize, contentMode: .aspectFill, options: nil) { (image, info) in
                if let image = image {
                    wself.images.append(image)
                    wself.collectionV.reloadData()
                }
            }
        })
    }
    
}

extension ViewController: UICollectionViewDelegate {
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as! MyCell
        cell.setImg(img: images[indexPath.row])
        return cell
    }
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {

        let margin: CGFloat = 1.0
        let width = collectionV.bounds.width / 3 - margin * 4.0
        let height = collectionV.bounds.width / 3 - margin * 4.0
        let size = CGSize(width: width, height: height)
        return size
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
}

