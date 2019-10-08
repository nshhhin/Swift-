//
//  ViewController.swift
//  Sample3-2
//
//  Created by 新納真次郎 on 2019/10/08.
//  Copyright © 2019 新納真次郎. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableV: UITableView!
    
    var tableCellCount: Int = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeTable()
    }

    func initializeTable(){
        tableV.delegate = self
        tableV.dataSource = self
    }
    
    func echoHoge(count: Int) -> String {
        var hoges: String = ""
        for i in 0..<count {
            hoges += "ほげ"
        }
        return hoges
    }
    @IBAction func tappedAddBtn(_ sender: Any) {
        tableCellCount += 1
        tableV.reloadData()
    }
}

extension ViewController: UITableViewDelegate {
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableCellCount
    }
       
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell")!
        cell.textLabel?.text = echoHoge(count: indexPath.row)
        return cell
    }
}
