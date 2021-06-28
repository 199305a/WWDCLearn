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
//    public let photo  = List <Photo>()
   
}
