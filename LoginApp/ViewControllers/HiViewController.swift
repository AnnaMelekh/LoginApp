

import UIKit

class HiViewController: UIViewController {

    @IBOutlet var hiText: UILabel!
    var name: String = ""
        
    override func viewDidLoad() {
        super.viewDidLoad()
        hiText.text = "Hi, " + userAnna.person.name
    }
}
