
import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    var shape : [Shape] = [Circle(color: .red, radius: 2.4), Rectangle(color: .blue, width: 2, height: 3), Triangle(color: .red, side: 12, height: 8)]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.reloadData()
        tableView.delegate = self
        tableView.dataSource = self
        getDataCircle(circleUrl: Constants.Urls.circleUrl)
        getDataRectangle(crectangleUrl: Constants.Urls.rectangleUrl)
        getDataTriangle(triangleUrl: Constants.Urls.triangleUrl)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shape.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let shapeName = String(describing: type(of: shape[indexPath.row].self))
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.ReuseConstants.CustomCell, for: indexPath) as! CustomCell
        cell.setData(title: shapeName)
        
        return cell
    }
    
   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       let vc = storyboard?.instantiateViewController(withIdentifier: Constants.ReuseConstants.SecondViewController) as? SecondViewController
       vc?.shape = shape[(tableView.indexPathForSelectedRow?.row)!]
       self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    func getDataCircle(circleUrl: String){
        var circles: [Circle] = []
        if let url = URL(string: Constants.Urls.circleUrl){
            let task = URLSession.shared.dataTask(with: url, completionHandler: { [self]data, response, error in
            guard let data = data, error == nil else { return }
            var result : CircleResult?
            do {
                result = try JSONDecoder().decode(CircleResult.self, from: data)
            }
            catch {
                print("Error: \(error)")
            }
            
            guard let json = result else { return }
            
            circles = json.shapes
            addNewShapes(shapeArray: circles)
        })
            task.resume()
        }
    }
    
    func getDataRectangle(crectangleUrl: String){
        var rectangles: [Rectangle] = []
        if let url = URL(string: Constants.Urls.rectangleUrl){
            let task = URLSession.shared.dataTask(with: url, completionHandler: { [self]data, response, error in
            guard let data = data, error == nil else { return }
            var result : RectangleResult?
            do {
                result = try JSONDecoder().decode(RectangleResult.self, from: data)
            }
            catch {
                print("Error: \(error)")
            }
            
            guard let json = result else { return }
            
            rectangles = json.shapes
            addNewShapes(shapeArray: rectangles)
        })
            task.resume()
        }
    }
    
    func getDataTriangle(triangleUrl: String){
        var triangles: [Triangle] = []
        if let url = URL(string: Constants.Urls.triangleUrl){
            let task = URLSession.shared.dataTask(with: url, completionHandler: { [self]data, response, error in
            guard let data = data, error == nil else { return }
            var result : TriangleResult?
            do {
                result = try JSONDecoder().decode(TriangleResult.self, from: data)
            }
            catch {
                print("Error: \(error)")
            }
            
            guard let json = result else { return }
            
            triangles = json.shapes
            addNewShapes(shapeArray: triangles)
        })
            task.resume()
        }
    }
    
    private func addNewShapes(shapeArray: [Shape]){
        shape.append(contentsOf: shapeArray)
        tableView.reloadData()
    }
    
    struct CircleResult: Codable {
            let shapes: [Circle]
        }
        
    struct RectangleResult: Codable {
        let shapes: [Rectangle]
    }
    
    struct TriangleResult: Codable {
        let shapes: [Triangle]
    }
}
