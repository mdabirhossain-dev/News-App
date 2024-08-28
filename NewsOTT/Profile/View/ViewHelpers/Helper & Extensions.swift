//
//  Helper & Extensions.swift
//  News OTT Profile
//
//  Created by Tanvir Rahman on 23/10/23.
//

import Foundation

extension Date {
    func format(format : String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        return dateFormatter.string(from: self)
    }
}
