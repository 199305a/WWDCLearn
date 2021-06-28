//
// Copyright © 2021 dev. All rights reserved.
// 

import Cocoa
import RealmSwift



class Photo: Object,Decodable {
    @objc public dynamic var identifier = ""
    @objc public dynamic var  aspectRatio = 0.0
    public let newsItem = LinkingObjects(fromType:NewsItem.self, property:"photos")
    required init(from decoder: Decoder) throws {

    }
}
