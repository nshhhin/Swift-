
import UIKit

extension UIColor {
    static func getRandomColor() -> UIColor {
        let randHue = CGFloat.random(in: 0...1)
        let color = UIColor(hue: randHue, saturation: 1, brightness: 1, alpha: 1)
        return color
    }
}
