//
//  TripsCollectionViewController.swift
//  TravelJournal2
//
//  Created by Niclas Nordling on 2021-11-29.
//  Copyright © 2021 Niclas Nordling. All rights reserved.
//

import UIKit

class TripsCollectionViewController: UICollectionViewController {

    let testData = [
        Trip2(title: "London", coverImageUrl: "background", date: Date(timeIntervalSince1970: 23153354)),
        Trip2(title: "Paris", coverImageUrl: "background2", date: Date(timeIntervalSince1970: 1231548)),
        Trip2(title: "Kuala Lumpur", coverImageUrl: "background", date: Date(timeIntervalSince1970: 2111522)),
        Trip2(title: "San Francisco", coverImageUrl: "background2", date: Date(timeIntervalSince1970: 45454122)),
        Trip2(title: "Mogadishu", coverImageUrl: "background", date: Date(timeIntervalSince1970: 138498498))
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.register(TripsCollectionViewCell.nib(), forCellWithReuseIdentifier: TripsCollectionViewCell.identifier)
        collectionView.collectionViewLayout = TripsCollectionViewCompositionLayout().createLayout()

    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: - UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return testData.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TripsCollectionViewCell.identifier, for: indexPath) as? TripsCollectionViewCell else { return UICollectionViewCell() }

        cell.configureContent(for: testData[indexPath.row])

        return cell
    }

    // MARK: - UICollectionViewDelegate

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("didSelectItemAt", testData[indexPath.row].title)
    }
}
