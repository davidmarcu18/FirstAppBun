
import Foundation
import UIKit

struct Triangle: Shape, Codable {
    
    var shapeEnum: ShapeEnum
    var color: UIColor
    var side: Double
    var height: Double

    private enum codingKeys: String, CodingKey {
        case type
        case color
        case side
        case height
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

    init(color: UIColor, side: Double, height: Double){
        self.color = color
        self.side = side
        self.height = height
        self.shapeEnum = .Triangle
    }
    
    init(from decoder: Decoder) throws{
        let container = try decoder.container(keyedBy: codingKeys.self)
        self.shapeEnum = try container.decode(ShapeEnum.self, forKey: .type)
        self .side = try container.decode(Double.self, forKey: .side)
        self.height = try container.decode(Double.self, forKey: .height)
        let color = try container.decode(String.self, forKey: .color).capitalized
        self.color = Rectangle.ConvertColor(color: ColorType(rawValue: color) ?? .Black)
    }
    
    func encode(to encoder: Encoder) throws{
        var container = encoder.container(keyedBy: codingKeys.self)
        try container.encode(shapeEnum.self, forKey: .type)
        try container.encode(side, forKey: .side)
        try container.encode(height, forKey: .height)
        let color = color.accessibilityName
        try container.encode(color, forKey: .color)
    }

    func perimeter() -> Double {
         side * 3
    }
    
    func area() -> Double {
        (pow(side, 2.0) * sqrt(3)) / 4
    }
}
