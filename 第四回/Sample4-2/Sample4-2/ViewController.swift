
import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {

    let ADD_API_URL  = "https://nino.nkmr.io/swifty-lecture/api/v1/useradd.php"
    let LIST_API_URL = "https://nino.nkmr.io/swifty-lecture/api/v1/userlist.php"

    var users: [String] = []

    @IBOutlet weak var tableV: UITableView! {
        didSet {
            tableV.delegate = self
            tableV.dataSource = self
        }
    }

    override func viewDidLoad() {
        addUser()
        listUser()
    }

    func addUser(){
        let uuid = UIDevice.current.identifierForVendor!.uuidString
        let params = ["uuid": uuid]
        super.viewDidLoad()
        Alamofire.request(ADD_API_URL, parameters: params).responseJSON{ response in
            guard let object = response.result.value else {
                return
            }
            let json = JSON(object)
            let status = json["status"]
            let results = json["results"]
        }
    }

    func listUser(){
        Alamofire.request(LIST_API_URL).responseJSON{ response in
            guard let object = response.result.value else {
                return
            }

            let json = JSON(object)
            let status = json["status"]
            let results = json["results"].array!
            self.users = []
            for result in results {
                guard let uuid = result["uuid"].string as? String else {
                    continue
                }
                self.users.append( uuid )
            }
            self.tableV.reloadData()
        }
    }

}

extension ViewController: UITableViewDelegate {

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let user = users[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        cell.textLabel?.text = user
        return cell
    }


}
