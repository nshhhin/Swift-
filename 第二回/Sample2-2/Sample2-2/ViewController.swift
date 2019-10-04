//
//  ViewController.swift
//  Sample2-2
//
//  Created by 新納真次郎 on 2019/10/04.
//  Copyright © 2019 新納真次郎. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var backgroundView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func tappedBtn(_ sender: Any) {
        backgroundView.backgroundColor = .red
    }
    
}

