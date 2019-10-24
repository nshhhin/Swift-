
import Foundation

struct Weather: Codable {
    var type: String
    var date: String
    var rainfall: Int

    private enum CodingKeys: String, CodingKey {
        case type = "Type"
        case date = "Date"
        case rainfall = "Rainfall"
    }
}
