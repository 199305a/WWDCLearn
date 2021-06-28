//
// Copyright © 2021 dev. All rights reserved.
// 

import Cocoa
import RealmSwift

enum PhotoRepresentationSize:Int {
    case mini = 256
    case small  = 512
    case medium = 1024
    case large = 2048
    static let all:[PhotoRepresentationSize] = [
        .mini,.small,.medium,.large
    ]
}


public class PhotoRepresentation: Object {

  @objc public dynamic   var remotePath = ""
    @objc public dynamic   var width = 0

//    public let photo = LinkingObjects(fromType: Photo.self, property:"representations")
    public let photo = LinkingObjects(fromType: Photo.self, property: "representations")

    public override class func primaryKey() -> String? {
        return "remotePath"
    }

}
