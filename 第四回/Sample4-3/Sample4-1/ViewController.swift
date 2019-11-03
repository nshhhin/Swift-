//
//  ViewController.swift
//  Sample4-1
//
//  Created by 新納真次郎 on 2019/10/24.
//  Copyright © 2019 新納真次郎. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {

    @IBOutlet weak var tableV: UITableView!
    var weathers: [Weather] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        prepareTable()
        requestAPI()
    }

    func prepareTable(){
        tableV.delegate = self
        tableV.dataSource = self
    }

    func requestAPI(){
        Alamofire.request(Config.apiURL).responseJSON { response in
            guard let object = response.result.value else {
               return
            }
            var json = JSON(object)
            json = json["Feature"][0]["Property"]["WeatherList"]["Weather"]
            self.weathers = try! JSONDecoder().decode([Weather].self, from: json.rawData())
            self.reloadTable()
        }
    }

    func reloadTable(){
        tableV.reloadData()
    }

}

extension ViewController: UITableViewDelegate {

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weathers.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let weather = weathers[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        cell.textLabel?.text = weather.date + " の降水確率: " + String(weather.rainfall)
        return cell
    }
}

