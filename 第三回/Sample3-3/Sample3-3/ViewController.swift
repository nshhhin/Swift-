//
//  ViewController.swift
//  Sample3-3
//
//  Created by 新納真次郎 on 2019/10/08.
//  Copyright © 2019 新納真次郎. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionV: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeCollectionV()
    }
    
    func initializeCollectionV(){
            collectionV.delegate = self
            collectionV.dataSource = self
    }

}

extension ViewController: UICollectionViewDelegate {
    
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath)
        cell.backgroundColor = .getRandomColor()
        return cell
    }
    
    
}
