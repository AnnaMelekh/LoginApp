

import UIKit

class AboutViewController: UIViewController {
    @IBOutlet var avatar: UILabel! = UILabel()
    
    @IBOutlet var name: UILabel! = UILabel()
    
    @IBOutlet var age: UILabel! = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        avatar.text = userAnna.person.photo
        name.text = "Name: " + userAnna.person.name
        age.text = "Age: " + userAnna.person.age
    }
    
}
