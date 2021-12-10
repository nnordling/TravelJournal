//
//  TripsCollectionViewCompositionalLayout.swift
//  TravelJournal2
//
//  Created by Niclas Nordling on 2021-11-29.
//  Copyright © 2021 Niclas Nordling. All rights reserved.
//

import Foundation
import UIKit

class TripsCollectionViewCompositionLayout {
    func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionProvider, layoutEnvironment) in
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.3))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 10)

            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
            let grouup = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])

            let section = NSCollectionLayoutSection(group: grouup)
            //section.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 20, bottom: 5, trailing: 20)

            return section
        }

        return layout
    }
}
