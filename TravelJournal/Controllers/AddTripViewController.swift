//
//  AddTripViewController.swift
//  TravelJournal2
//
//  Created by Niclas Nordling on 2021-12-08.
//  Copyright © 2021 Niclas Nordling. All rights reserved.
//

import UIKit

class AddTripViewController: UIViewController {
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var coverImage: UIImageView!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var journalTextView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()

        coverImage.layer.cornerRadius = 10
        journalTextView.layer.cornerRadius = 10
        journalTextView.layer.borderWidth = 1
        journalTextView.layer.borderColor = UIColor.lightGray.cgColor
    }

    @IBAction func dismissView() {
        dismiss(animated: true)
    }

    @IBAction func saveTrip() {

    }

}
