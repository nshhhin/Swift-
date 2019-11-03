
import UIKit
import Lottie

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let animationV = AnimationView(name: "アニメーションファイル名")
        animationV.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        animationV.center = CGPoint(x: self.view.center.x, y: self.view.center.y)
        self.view.addSubview(animationV)
        animationV.animationSpeed = 1.0
        animationV.loopMode = .loop
        animationV.play()
    }


}

