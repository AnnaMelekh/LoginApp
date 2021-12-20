

import UIKit

class ViewController: UIViewController {

    @IBOutlet var textUser: UITextField!
    @IBOutlet var textPass: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setGradientBackground()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tabBarController = segue.destination as! UITabBarController
       
        let viewControllers = tabBarController.viewControllers
        
        for viewController in viewControllers! {
        if let welcomeVC = viewController as? HiViewController {
            welcomeVC.name = textUser.text ?? ""
            }
        }
        
        tabBarController.modalPresentationStyle = .fullScreen
    }
            

    @IBAction func LoginButton() {
        
        if textUser.text != userAnna.name || textPass.text != userAnna.password {
            showAlert(title: "Error", message: "Wrong name or pass")
        } else if textUser.text == userAnna.name && textPass.text == userAnna.password {
            
        }
    }
    
    @IBAction func forgotName() {
        showAlert(title: "Oops", message: "Your name is User")
    }
    
    @IBAction func forgotPassword() {
        showAlert(title: "Oops", message: "Your password is Password😉")
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        textUser.text = nil
        textPass.text = nil
    }
}


extension ViewController {
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(okAction)
        present (alert, animated: true)
    }
}

extension ViewController {
    private func setGradientBackground() {
        let colorTop =  UIColor(red: 255.0/255.0, green: 149.0/255.0, blue: 0.0/255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 255.0/255.0, green: 94.0/255.0, blue: 58.0/255.0, alpha: 1.0).cgColor
                    
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.view.bounds
                
        self.view.layer.insertSublayer(gradientLayer, at:0)
    }
}

extension ViewController {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
}

