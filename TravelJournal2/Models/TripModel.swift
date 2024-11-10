import Foundation
import SwiftData

// TODO: rename to Trip
@Model class TripModel {
    @Attribute(.unique) var id: String
    @Attribute var title: String
    @Attribute var coverImageIdentifier: String?
    @Attribute var startDate: Date?
    @Attribute var endDate: Date?
    @Attribute var longitude: Int
    @Attribute var latitude: Int
    @Attribute var posts: [String]

    init(id: String,
         title: String,
         coverImageIdentifier: String?,
         startDate: Date?,
         endDate: Date?,
         longitude: Int, latitude: Int,
         posts: [String]) {
        self.id = id
        self.title = title
        self.coverImageIdentifier = coverImageIdentifier
        self.startDate = startDate
        self.endDate = endDate
        self.longitude = longitude
        self.latitude = latitude
        self.posts = posts
    }

    convenience init(title: String,
                     coverImageIdentifier: String?,
                     startDate: Date?,
                     endDate: Date?,
                     longitude: Int,
                     latitude: Int) {
        self.init(id: UUID().uuidString,
                  title: title,
                  coverImageIdentifier: coverImageIdentifier,
                  startDate: startDate,
                  endDate: endDate,
                  longitude: longitude,
                  latitude: latitude,
                  posts: [])
    }
}
