//
//  UserDefaultsManager.swift
//  NewsOTT
//
//  Created by Tanvir Rahman on 7/11/23.
//

import Foundation

class UserDefaultsManager {
    static let shared = UserDefaultsManager()
    
    private init() {}
    
    func set(value: Any?, forKey key: String) {
        UserDefaults.standard.set(value, forKey: key)
    }
    
    func value(forKey key: String) -> Any? {
        return UserDefaults.standard.value(forKey: key)
    }
    
    func removeValue(forKey key: String) {
        UserDefaults.standard.removeObject(forKey: key)
    }
    func getString(forkey key: String) -> String? {
        return UserDefaults.standard.string(forKey: key)
    }
}
