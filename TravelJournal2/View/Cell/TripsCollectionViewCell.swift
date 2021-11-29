//
//  TripsCollectionViewCell.swift
//  TravelJournal2
//
//  Created by Niclas Nordling on 2021-11-29.
//  Copyright © 2021 Niclas Nordling. All rights reserved.
//

import UIKit

class TripsCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var textBackgroundView: UIView!
    @IBOutlet weak var tripTitle: UILabel!
    @IBOutlet weak var tripDate: UILabel!

    static let identifier = "TripsCollectionViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()

        self.layer.cornerRadius = 25
    }

    func configureContent() {

    }

    static func nib() -> UINib {
        return UINib(nibName: "TripsCollectionViewCell", bundle: nil)
    }

}
