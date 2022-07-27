//
//  Shape.swift
//  FirstAppBun
//
//  Created by David Alex Marcu on 19.07.2022.
//

import Foundation
import UIKit

protocol Shape {
    var color: UIColor { get }
    var shapeEnum: ShapeEnum { get }
    func perimeter() -> Double
    func area() -> Double
}
