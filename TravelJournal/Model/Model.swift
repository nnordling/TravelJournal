//
//  Model.swift
//  TravelJournal2
//
//  Created by Niclas Nordling on 2021-11-27.
//  Copyright © 2021 Niclas Nordling. All rights reserved.
//

import Foundation
import FirebaseFirestoreSwift

struct User: Codable {
    @DocumentID var id: String?
    var username: String
    var email: String
    var trips: [Trip2]?
    var posts: [Post2]?
}

struct Trip2: Codable {
    var title: String
    var coverImageUrl: String
    var date: Date
}

struct Post2: Codable {
    var images: [String]
    var title: String
    var text: String
    var date: Date
}
