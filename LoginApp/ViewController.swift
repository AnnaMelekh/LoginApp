//
//  ViewController.swift
//  LoginApp
//
//  Created by Анна Мелехина on 15.12.2021.
//  Copyright © 2021 Anna Melekhina. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var textUser: UITextField!
    @IBOutlet var textPass: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let inputText = textUser.text, !inputText.isEmpty else {
            showAlert(title: "Error", message: "Wrong name")
            return
        }
        let hiVC = segue.destination as! HiViewController
        hiVC.name = textUser.text
    }

    @IBAction func LoginButton() {
        if textUser.text != "Name" && textPass.text != "Password" {
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
}


extension ViewController {
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(okAction)
        present (alert, animated: true)
    }
}

