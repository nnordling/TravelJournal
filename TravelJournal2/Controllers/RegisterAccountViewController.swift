//
//  RegisterAccountViewController.swift
//  TravelJournal2
//
//  Created by Niclas Nordling on 2021-11-29.
//  Copyright © 2021 Niclas Nordling. All rights reserved.
//

import UIKit
import FirebaseAuth

class RegisterAccountViewController: UIViewController {
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.tintColor = .white

        registerButton.layer.cornerRadius = registerButton.bounds.height / 2

        view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing)))
    }

    @IBAction func registerUser() {
        guard let username = usernameTextField.text,
              let email = emailTextField.text,
              let password = passwordTextField.text,
              let confirmPassword = confirmPasswordTextField.text
        else {
            return
        }

        guard let _ = email.range(of: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}", options: .regularExpression) else {
            print("Invalid Email")
            return
        }

        guard password == confirmPassword else {
            print("passwords doesn't match")
            return
        }

        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            if let error = error {
                let alert = UIAlertController(title: NSLocalizedString("Register failed", comment: ""), message: "\(error.localizedDescription)", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: ""), style: .default, handler: nil))

                self.present(alert, animated: true, completion: nil)

            } else {
                let changeRequest = user?.user.createProfileChangeRequest()
                changeRequest?.displayName = username
                changeRequest?.commitChanges(completion: { error in
                    print("unable to set display name. Error: \(String(describing: error?.localizedDescription))")
                })

                let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
                let mainViewController = mainStoryboard.instantiateViewController(withIdentifier: "MainViewController") as? MainViewController

                self.view.window?.rootViewController = mainViewController
                self.view.window?.makeKeyAndVisible()
            }
        }
    }

}

extension RegisterAccountViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.resignFirstResponder()
    }
}
