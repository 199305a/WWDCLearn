//
// Copyright © 2021 dev. All rights reserved.
//

import Cocoa
import RealmSwift

public class Photo: Object, Decodable {
    @objc public dynamic var identifier = ""
    @objc public dynamic var aspectRatio = 0.0
    public let newsItem = LinkingObjects(fromType: NewsItem.self, property: "photos")
     public let representations = List<PhotoRepresentation>()


    public override class func primaryKey() -> String? {
        return "identifier"
    }
    private enum CodingKeys:String,CodingKey{
        case id, ratio
    }

   public convenience  required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let id = try container.decode(String.self, forKey: .id)
        let ratio = try container.decode(Double.self, forKey: .ratio)
        let representations = PhotoRepresentationSize.all.map { size -> PhotoRepresentation in
            let rep = PhotoRepresentation()
            rep.remotePath = "\(id)/\(size.rawValue).jpeg"
            rep.width = size.rawValue
            return rep
        }
        self.init()
    self.identifier = id
    self.aspectRatio = ratio
    self.representations.append(objectsIn: representations)
    }
}
