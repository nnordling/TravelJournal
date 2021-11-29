//
//  SignInOptionsViewController.swift
//  TravelJournal2
//
//  Created by Niclas Nordling on 2021-11-28.
//  Copyright © 2021 Niclas Nordling. All rights reserved.
//

import UIKit

class SignInOptionsViewController: UIViewController {
    @IBOutlet weak var signInButtonsStackView: UIStackView!
    @IBOutlet weak var signInWithUsername: UIButton!
    @IBOutlet weak var signInWithApple: UIButton!
    @IBOutlet weak var signInWithGoogle: UIButton!
    @IBOutlet weak var signInWithFacebook: UIButton!
    @IBOutlet weak var signUpLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        for button in signInButtonsStackView.arrangedSubviews {
            guard let button = button as? UIButton else { return }
            button.layer.cornerRadius = button.bounds.height / 2
        }
    }

}
