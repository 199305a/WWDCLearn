//
// Copyright © 2021 dev. All rights reserved.
// 

import Cocoa
import RealmSwift



public enum NewsType:Int {
   case news
    case unsupportedUnknown
    case gallery
    case unsupportedPassbook
}


public class NewsItem: Object,ConditionallyDecodable {
     @objc public dynamic var identifier = ""
    @objc public dynamic var newsType = 0
    @objc public dynamic var visibility = ""
    @objc public dynamic var date = Date.distantPast
    @objc public dynamic var title  = ""
    @objc public dynamic var body = ""

    public let photo  = List <Photo>()

    public override class func primaryKey() -> String? {
        return "identifier"
    }
    private enum CodingKeys:String,CodingKey {
   case id, title, body, timestamp,visibility ,photos ,type
    }
    public convenience required init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        if let type = try container.decodeIfPresent(String.self, forKey: .type),type == "pass" {
            throw ConditionallyDecodableError.unsupported
        }
        identifier = try container.decode(key: .id)
        title = try container.decode(key: .title)
        body = try container.decodeIfPresent(key: .body) ?? ""
        visibility = try container.decodeIfPresent(key: .visibility) ?? ""
        date = Date(timeIntervalSince1970: try container.decode(key: .timestamp))
        try container.decodeIfPresent([Photo].self, forKey: .photos).map { photos.append(objectsin: $0)}
        self.newsType = self.photos.count > 0 ? NewsType.gallery.rawValue : NewsType.news.rawValue

    }
   
}
