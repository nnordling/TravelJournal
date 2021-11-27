//
//  UserViewModel.swift
//  TravelJournal2
//
//  Created by Niclas Nordling on 2021-11-27.
//  Copyright © 2021 Niclas Nordling. All rights reserved.
//

import Foundation
import FirebaseCore
import FirebaseFirestore
import FirebaseStorage
import FirebaseFirestoreSwift

class UserViewModel {
    private let db = Firestore.firestore()
    var user: User?
    var trips: [Trip2]?
    var posts: [Post2]?

    func fetchUser(email: String) {
        let docRef = db.collection("Users").whereField("email", isEqualTo: email)

        docRef.getDocuments { querySnapshot, error in
            guard let userFound = querySnapshot?.documents.first else { return }

            do {
                self.user = try userFound.data(as: User.self)
            } catch (let decodingError) {
                print("decodingError", decodingError)
            }
        }
    }

    func fetchData() {
        guard let user = user else { return }
        let docRef = db.collection("Users").document(user.email)

        docRef.getDocument { document, error in
            if let error = error {
                print("error", error)
                return
            }

            if let document = document {
                do {
                    self.user = try document.data(as: User.self)
                } catch (let decodingError) {
                    print(decodingError)
                }
            }
        }
    }
}
