
import Foundation
import UIKit

protocol Shape {
    var color: UIColor { get }
    var shapeEnum: ShapeEnum { get }
    func perimeter() -> Double
    func area() -> Double
}
