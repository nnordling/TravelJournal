//
//  SignInViewController.swift
//  TravelJournal2
//
//  Created by Niclas Nordling on 2021-11-29.
//  Copyright © 2021 Niclas Nordling. All rights reserved.
//

import UIKit
import FirebaseAuth

class SignInViewController: UIViewController {
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var errorView: UIView!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.tintColor = .white

        signInButton.layer.cornerRadius = signInButton.bounds.height / 2
        errorView.layer.cornerRadius = 10
        errorView.isHidden = true

        view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing)))
    }
    
    @IBAction func openInfoMenu() {
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let forgotPwAction = UIAlertAction(title: "Forgot Password?", style: .default, handler: { _ in print("Forgot password") })
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(forgotPwAction)
        alertController.addAction(cancelAction)

        present(alertController, animated: true, completion: nil)
    }

    @IBAction func signIn() {
        guard let email = usernameTextField.text, let password = passwordTextField.text else { return }

        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in

            if let error = error {
                let alert = UIAlertController(title: NSLocalizedString("Login failed", comment: ""), message: "\(error.localizedDescription)", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: ""), style: .default, handler: { _ in
                    //NSLog("The \"OK\" alert occured.")
                }))
                self.present(alert, animated: true, completion: nil)
                print(error)

            } else {
                let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
                let mainViewController = mainStoryboard.instantiateViewController(withIdentifier: "MainViewController") as? MainViewController

                self.view.window?.rootViewController = mainViewController
                self.view.window?.makeKeyAndVisible()
            }
        }
    }
}

extension SignInViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.resignFirstResponder()
    }
}
