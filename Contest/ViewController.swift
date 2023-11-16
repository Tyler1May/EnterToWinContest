//
//  ViewController.swift
//  Contest
//
//  Created by Tyler May on 11/16/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var emailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func submitButtonTapped(_ sender: Any) {
        if let email = emailTextField.text, !isValidEmail(email) {
            animateTextFieldShake()
        } else {
            performSegue(withIdentifier: "toSuccessScreen", sender: self)
        }
    }
    
    func animateTextFieldShake() {
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunctions = [
            CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut),
            CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        ]
        animation.values = [-10,10,-10,10,-5,5,-2,2,0]
        animation.duration = 0.5
        emailTextField.layer.add(animation, forKey: "shake")
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
    
}

