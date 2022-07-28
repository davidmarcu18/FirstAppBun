
import Foundation
import UIKit

struct Circle: Shape, Codable {
    
    var shapeEnum: ShapeEnum
    var color: UIColor
    var radius: Double
    
    private enum codingKeys: String, CodingKey{
        case type
        case radius
        case color
    }
    
    static func ConvertColor(color: ColorType) -> UIColor {
            switch(color){
                case  .Red :
                    return .systemRed
                case  .Yellow :
                    return .systemYellow
                case  .Blue :
                    return .systemBlue
                case  .Brown :
                    return .systemBrown
                case  .White :
                    return .white
                default:
                    return .black
            }
        }

    init(color: UIColor, radius: Double) {
        self.color = color
        self.radius = radius
        self.shapeEnum = .Circle
    }
    
    init(from decoder: Decoder) throws{
        let container = try decoder.container(keyedBy: codingKeys.self)
        let color = try container.decode(String.self, forKey: .color).capitalized
        self.shapeEnum = try container.decode(ShapeEnum.self, forKey: .type)
        self.radius = try container.decode(Double.self, forKey: .radius)
        self.color = Circle.ConvertColor(color: ColorType(rawValue: color) ?? .Black)
    }
    
    func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: codingKeys.self)
            try container.encode(shapeEnum.self, forKey: .type)
            try container.encode(radius, forKey: .radius)
            let color = color.accessibilityName
            try container.encode(color, forKey: .color)
        }
    
    func perimeter() -> Double {
         2 * Double.pi * radius
    }
    
    func area() -> Double {
        Double.pi * pow(radius, 2.0)
    }
}
