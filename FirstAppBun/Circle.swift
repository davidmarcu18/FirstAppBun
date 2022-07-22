//
//  Circle.swift
//  FirstAppBun
//
//  Created by David Alex Marcu on 19.07.2022.
//

import Foundation
import UIKit

struct Circle: Shape {
    
    var shapeEnum: ShapeEnum
    var color: UIColor
    var radius: Double
    
    init(color: UIColor, radius: Double){
        self.color = color
        self.radius = radius
        self.shapeEnum = .Circle
    }

    func perimeter() -> Double {
         2 * Double.pi * radius
        
    }
    
    func area() -> Double {
        Double.pi * pow(radius, 2.0)
        
        
    }
}
