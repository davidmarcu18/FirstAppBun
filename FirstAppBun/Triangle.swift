//
//  Triangle.swift
//  FirstAppBun
//
//  Created by David Alex Marcu on 19.07.2022.
//

import Foundation
import UIKit

struct Triangle: Shape {
    
    var shapeEnum: ShapeEnum
    var color: UIColor
    var side: Double
    var height: Double
    
    
    
    
    
    init(color: UIColor, side: Double, height: Double){
        self.color = color
        self.side = side
        self.height = height
        self.shapeEnum = .Triangle
    }
    
    func perimeter() -> Double {
         side * 3
    }
    
    func area() -> Double {
        (pow(side, 2.0) * sqrt(3)) / 4
    }
    
    
}
