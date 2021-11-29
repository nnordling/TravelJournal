//
//  SignInViewController.swift
//  TravelJournal2
//
//  Created by Niclas Nordling on 2021-11-29.
//  Copyright © 2021 Niclas Nordling. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var infoButton: UIButton!
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var errorView: UIView!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        signInButton.layer.cornerRadius = signInButton.bounds.height / 2
        errorView.layer.cornerRadius = 10
        errorView.isHidden = true
    }
    
    @IBAction func openInfoMenu() {
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let forgotPwAction = UIAlertAction(title: "Forgot Password?", style: .default, handler: { _ in print("Forgot password") })
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(forgotPwAction)
        alertController.addAction(cancelAction)

        present(alertController, animated: true, completion: nil)
    }

    @IBAction func closeViewController() {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func signIn() {

    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
