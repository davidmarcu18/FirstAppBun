//
//  ViewController.swift
//  FirstAppBun
//
//  Created by David Alex Marcu on 19.07.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    var shape : [Shape] = [Circle(color: .red, radius: 2.4), Rectangle(color: .blue, width: 2, height: 3), Triangle(color: .red, side: 12, height: 8)]
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.reloadData()
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shape.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let shapeName = String(describing: type(of: shape[indexPath.row].self))
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = shape[indexPath.row].color.accessibilityName + " " + shapeName
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetails", sender: self)
        
    /*@IBAction func buttonPressed(_ sender: UIButton) {
        switch sender.tag {
            case 0: drawLines()
            case 1: drawRectangle()
            case 2: drawCircle()
            default: print("default")
        }
    }*/
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? SecondViewController{
            destination.shape = shape[(tableView.indexPathForSelectedRow?.row)!]
       }
    }
    

}
