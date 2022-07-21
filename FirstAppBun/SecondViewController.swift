//
//  SecondViewController.swift
//  FirstAppBun
//
//  Created by David Alex Marcu on 19.07.2022.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var perimeterLbl: UILabel!
    @IBOutlet weak var areaLbl: UILabel!
    
    var shape: Shape?
    var image = UIImage()//
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let shape = shape {
            perimeterLbl.text = String(shape.perimeter())
            areaLbl.text = String(shape.area())
            determinShape()
        
            
        }
        
        
        
    }
    func determinShape(){
        let shapeName = String(describing: type(of: shape.self))
        if shapeName == "Circle"{
            drawCircle(circle: shape as! Circle)
        }
    }
    
    
    func drawLines() {
        // 1
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 280, height: 250))

        let img = renderer.image { ctx in
            // 2
            ctx.cgContext.move(to: CGPoint(x: 20.0, y: 20.0))
            ctx.cgContext.addLine(to: CGPoint(x: 260.0, y: 230.0))
            ctx.cgContext.addLine(to: CGPoint(x: 100.0, y: 200.0))
            ctx.cgContext.addLine(to: CGPoint(x: 20.0, y: 20.0))

            ctx.cgContext.setLineWidth(10)
            ctx.cgContext.setStrokeColor(UIColor.black.cgColor)

            // 3
            ctx.cgContext.strokePath()
        }

        imageView.image = img
    }
        
    func drawRectangle(rectangle: Rectangle) {
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 280, height: 250))

        let img = renderer.image { ctx in
            let rectangle = CGRect(x: 0, y: 0, width: 280, height: 250)

            // 4
            ctx.cgContext.setFillColor(UIColor.yellow.cgColor)
            ctx.cgContext.setStrokeColor(UIColor.gray.cgColor)
            ctx.cgContext.setLineWidth(20)

            // 5
            ctx.cgContext.addRect(rectangle)
            ctx.cgContext.drawPath(using: .fillStroke)
        }

        imageView.image = img
    }
        
    func drawCircle(circle: Circle) {
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 280, height: 250))

        let img = renderer.image { ctx in
            let rect = CGRect(x: 5, y: 5, width: 270, height: 240)

            // 6
            ctx.cgContext.setFillColor(UIColor.blue.cgColor)
            ctx.cgContext.setStrokeColor(UIColor.black.cgColor)
            ctx.cgContext.setLineWidth(10)

            ctx.cgContext.addEllipse(in: rect)
            ctx.cgContext.drawPath(using: .fillStroke)
        }

        imageView.image = img
    }
    
    /*func determinShape(){
        if()
    }*/
    
}
    
    
