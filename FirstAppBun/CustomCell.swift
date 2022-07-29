
import UIKit

class CustomCell: UITableViewCell {
    @IBOutlet var ImageView2: UIImageView!
    @IBOutlet var TextLabel2: UILabel!

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setData(title: String) {
        TextLabel2.text = title
        ImageView2.image = UIImage(systemName: title.lowercased())
    }
}
