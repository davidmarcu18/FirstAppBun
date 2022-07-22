//
//  Rectangle.swift
//  FirstAppBun
//
//  Created by David Alex Marcu on 19.07.2022.
//

import Foundation
import UIKit

struct Rectangle: Shape{
    
    var shapeEnum: ShapeEnum
    var color: UIColor
    var width: Double
    var height: Double
    
    init(color: UIColor, width: Double, height: Double){
        self.color = color
        self.width = width
        self.height = height
        self.shapeEnum = .Rectangle
    }
    
    func perimeter() -> Double {
        width * 2 + height * 2
    }
    
    func area() -> Double {
         width * height
    }
    
    
    
}
