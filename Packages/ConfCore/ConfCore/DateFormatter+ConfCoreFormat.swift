//
// Copyright © 2021 dev. All rights reserved.
// 

import Foundation


public let confCoreDateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"

extension DateFormatter {
    static let confCoreFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = confCoreDateFormat
        formatter.locale = Locale(identifier: "en-US")
        formatter.timeZone = TimeZone.current

        return formatter
    }()
    
}
