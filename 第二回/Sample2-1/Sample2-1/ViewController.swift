
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func tappedBtn(_ sender: Any) {
        label.text = "Hello, World"
    }

}

