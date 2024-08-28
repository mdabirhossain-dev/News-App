//
//  LanguageObserver.swift
//  NewsOTT
//
//  Created by Tanvir Rahman on 2/11/23.
//

import Foundation

class LanguageChangeObserver: ObservableObject {
    @Published var languageName: String = "en"
}

extension String {
    func localizableString(_ name: String) -> String {
        let path = Bundle.main.path(forResource: name, ofType: "lproj")
        let bundle = Bundle(path: path!)
        return NSLocalizedString(self, tableName: nil, bundle: bundle!, value: "", comment: "")
    }
}
