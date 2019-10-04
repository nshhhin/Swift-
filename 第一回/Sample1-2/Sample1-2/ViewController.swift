//
//  ViewController.swift
//  Sample1-2
//
//  Created by 新納真次郎 on 2019/10/04.
//  Copyright © 2019 新納真次郎. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print( getSum(num: 50) )
    }
    
    func getSum(num: Int) -> Int {
        var sum = 0
        for i in 0..<num {
            sum = sum + i
        }
        return sum
    }


}

