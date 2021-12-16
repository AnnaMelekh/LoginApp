

import UIKit

class ViewController: UIViewController {

    @IBOutlet var textUser: UITextField!
    @IBOutlet var textPass: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setGradientBackground()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let hiVC = segue.destination as! HiViewController
        hiVC.name = textUser.text
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    @IBAction func LoginButton() {
        guard let inputText = textUser.text, !inputText.isEmpty else {
            showAlert(title: "Error", message: "Wrong name")
            return
        }

        if textUser.text != "Name", textPass.text != "Password" {
            showAlert(title: "Error", message: "Wrong name or pass")
        } else if textUser.text == "Name" && textPass.text == "Password" {
            performSegue(withIdentifier: "Go", sender: nil)
        }
    }
    
    @IBAction func forgotName() {
        showAlert(title: "Oops", message: "Your name is User")
    }
    
    @IBAction func forgotPassword() {
        showAlert(title: "Oops", message: "Your password is Password😉")
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        let _ = segue.source as! HiViewController
        textUser.text = nil
        textPass.text = nil

    }
    
    func setGradientBackground() {
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
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(okAction)
        present (alert, animated: true)
    }
}

