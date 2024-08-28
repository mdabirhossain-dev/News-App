//
//  ShowInfos.swift
//  OTT App
//
//  Created by Md Abir Hossain on 04-09-2023.
//

import Foundation
import SwiftUI


struct NewsInfos: Identifiable {
    let id = UUID()
    let newsThumbnail: String
    let newsTitle: String
    let watched: Double
    let publishTime: String
}


let showInfos: [NewsInfos] = [
    NewsInfos(newsThumbnail: "image 0", newsTitle: "Israel considers steps to deport", watched: 8.5, publishTime: "5 min ago"), NewsInfos(newsThumbnail: "image 1", newsTitle: "Ayman leaves behind swirls", watched: 5.9, publishTime: "7 min ago"), NewsInfos(newsThumbnail: "image 2", newsTitle: "At least 16 people were", watched: 6.7, publishTime: "2 min ago"), NewsInfos(newsThumbnail: "image 3", newsTitle: "Ayman leaves behind swirls", watched: 7.3, publishTime: "13 min ago"), NewsInfos(newsThumbnail: "image 4", newsTitle: "At least 16 people were", watched: 7.9, publishTime: "10 min ago"), NewsInfos(newsThumbnail: "image 5", newsTitle: "At least 16 people were", watched: 5.5, publishTime: "4 min ago"), NewsInfos(newsThumbnail: "image 6", newsTitle: "Israel considers steps to deport", watched: 8.5, publishTime: "1 min ago"), NewsInfos(newsThumbnail: "image 1", newsTitle: "Ayman leaves behind swirls", watched: 5.9, publishTime: "17 min ago"), NewsInfos(newsThumbnail: "image 2", newsTitle: "Ayman leaves behind swirls", watched: 6.7, publishTime: "1 min ago"), NewsInfos(newsThumbnail: "image 3", newsTitle: "At least 16 people were", watched: 7.3, publishTime: "18 min ago"), NewsInfos(newsThumbnail: "image 4", newsTitle: "Ayman leaves behind swirls", watched: 7.9, publishTime: "0 min ago"), NewsInfos(newsThumbnail: "image 5", newsTitle: "Israel considers steps to deport", watched: 5.5, publishTime: "0 min ago"), NewsInfos(newsThumbnail: "image 0", newsTitle: "At least 16 people were", watched: 8.5, publishTime: "10 min ago"), NewsInfos(newsThumbnail: "image 1", newsTitle: "Ayman leaves behind swirls", watched: 5.9, publishTime: "0 min ago"), NewsInfos(newsThumbnail: "image 2", newsTitle: "Ayman leaves behind swirls", watched: 6.7, publishTime: "3 min ago"), NewsInfos(newsThumbnail: "image 3", newsTitle: "Israel considers steps to deport", watched: 7.3, publishTime: "0 min ago"), NewsInfos(newsThumbnail: "image 4", newsTitle: "At least 16 people were", watched: 7.9, publishTime: "22 min ago"), NewsInfos(newsThumbnail: "image 5", newsTitle: "Israel considers steps to deport", watched: 5.5, publishTime: "0 min ago")
]


let recommendedShows: [NewsInfos] = [
    NewsInfos(newsThumbnail: "image 0", newsTitle: "Israel considers steps to deport", watched: 8.5, publishTime: "5 min ago"), NewsInfos(newsThumbnail: "image 1", newsTitle: "Ayman leaves behind swirls", watched: 5.9, publishTime: "7 min ago"), NewsInfos(newsThumbnail: "image 2", newsTitle: "At least 16 people were", watched: 6.7, publishTime: "2 min ago"), NewsInfos(newsThumbnail: "image 3", newsTitle: "Ayman leaves behind swirls", watched: 7.3, publishTime: "13 min ago"), NewsInfos(newsThumbnail: "image 4", newsTitle: "At least 16 people were", watched: 7.9, publishTime: "10 min ago")
]

 

// Search history
var searchHistory: [String] = []

// Add to search history
public func addRecent(recent: String) {
    if !recent.isEmpty {
        if searchHistory.count >= 5 {
            searchHistory.removeLast()
        }
        searchHistory.insert(recent, at: 0)
    }
}

let latest: [NewsInfos] = [
    NewsInfos(newsThumbnail: "image 0", newsTitle: "Israel considers steps to deport", watched: 8.5, publishTime: "5 min ago"),
    NewsInfos(newsThumbnail: "image 1", newsTitle: "Ayman leaves behind swirls", watched: 5.9, publishTime: "7 min ago"),
    NewsInfos(newsThumbnail: "image 2", newsTitle: "At least 16 people were", watched: 6.7, publishTime: "2 min ago"),
    NewsInfos(newsThumbnail: "image 3", newsTitle: "Ayman leaves behind swirls", watched: 7.3, publishTime: "13 min ago"),
    NewsInfos(newsThumbnail: "image 4", newsTitle: "At least 16 people were", watched: 7.9, publishTime: "10 min ago"),
    NewsInfos(newsThumbnail: "image 5", newsTitle: "At least 16 people were", watched: 5.5, publishTime: "4 min ago"),
    NewsInfos(newsThumbnail: "image 6", newsTitle: "Israel considers steps to deport", watched: 8.5, publishTime: "1 min ago"),
    NewsInfos(newsThumbnail: "image 1", newsTitle: "Ayman leaves behind swirls", watched: 5.9, publishTime: "17 min ago"),
    NewsInfos(newsThumbnail: "image 2", newsTitle: "Ayman leaves behind swirls", watched: 6.7, publishTime: "1 min ago"),
    NewsInfos(newsThumbnail: "image 3", newsTitle: "At least 16 people were", watched: 7.3, publishTime: "18 min ago"),
    NewsInfos(newsThumbnail: "image 4", newsTitle: "Ayman leaves behind swirls", watched: 7.9, publishTime: "0 min ago"),
    NewsInfos(newsThumbnail: "image 5", newsTitle: "Israel considers steps to deport", watched: 5.5, publishTime: "0 min ago"),
    NewsInfos(newsThumbnail: "image 0", newsTitle: "At least 16 people were", watched: 8.5, publishTime: "10 min ago"),
    NewsInfos(newsThumbnail: "image 1", newsTitle: "Ayman leaves behind swirls", watched: 5.9, publishTime: "0 min ago"),
    NewsInfos(newsThumbnail: "image 2", newsTitle: "Ayman leaves behind swirls", watched: 6.7, publishTime: "3 min ago"),
    NewsInfos(newsThumbnail: "image 3", newsTitle: "Israel considers steps to deport", watched: 7.3, publishTime: "0 min ago"),
    NewsInfos(newsThumbnail: "image 4", newsTitle: "At least 16 people were", watched: 7.9, publishTime: "22 min ago"),
    NewsInfos(newsThumbnail: "image 5", newsTitle: "Israel considers steps to deport", watched: 5.5, publishTime: "0 min ago")
]

let popular: [NewsInfos] = [
    NewsInfos(newsThumbnail: "image 1", newsTitle: "Ayman leaves behind swirls", watched: 5.9, publishTime: "7 min ago"),
    NewsInfos(newsThumbnail: "image 2", newsTitle: "At least 16 people were", watched: 6.7, publishTime: "2 min ago"),
    NewsInfos(newsThumbnail: "image 3", newsTitle: "Ayman leaves behind swirls", watched: 7.3, publishTime: "13 min ago"),
    NewsInfos(newsThumbnail: "image 4", newsTitle: "At least 16 people were", watched: 7.9, publishTime: "10 min ago"),
    NewsInfos(newsThumbnail: "image 5", newsTitle: "At least 16 people were", watched: 5.5, publishTime: "4 min ago"),
    NewsInfos(newsThumbnail: "image 6", newsTitle: "Israel considers steps to deport", watched: 8.5, publishTime: "1 min ago"),
    NewsInfos(newsThumbnail: "image 1", newsTitle: "Ayman leaves behind swirls", watched: 5.9, publishTime: "17 min ago"),
    NewsInfos(newsThumbnail: "image 2", newsTitle: "Ayman leaves behind swirls", watched: 6.7, publishTime: "1 min ago"),
    NewsInfos(newsThumbnail: "image 3", newsTitle: "At least 16 people were", watched: 7.3, publishTime: "18 min ago"),
    NewsInfos(newsThumbnail: "image 4", newsTitle: "Ayman leaves behind swirls", watched: 7.9, publishTime: "0 min ago"),
    NewsInfos(newsThumbnail: "image 5", newsTitle: "Israel considers steps to deport", watched: 5.5, publishTime: "0 min ago")
]

let oldest: [NewsInfos] = [
    NewsInfos(newsThumbnail: "image 4", newsTitle: "At least 16 people were", watched: 7.9, publishTime: "22 min ago"),
    NewsInfos(newsThumbnail: "image 5", newsTitle: "Israel considers steps to deport", watched: 5.5, publishTime: "0 min ago"),
    NewsInfos(newsThumbnail: "image 0", newsTitle: "Israel considers steps to deport", watched: 8.5, publishTime: "5 min ago"),
    NewsInfos(newsThumbnail: "image 1", newsTitle: "Ayman leaves behind swirls", watched: 5.9, publishTime: "7 min ago"),
    NewsInfos(newsThumbnail: "image 2", newsTitle: "At least 16 people were", watched: 6.7, publishTime: "2 min ago"),
    NewsInfos(newsThumbnail: "image 3", newsTitle: "Ayman leaves behind swirls", watched: 7.3, publishTime: "13 min ago"),
    NewsInfos(newsThumbnail: "image 4", newsTitle: "At least 16 people were", watched: 7.9, publishTime: "10 min ago"),
    NewsInfos(newsThumbnail: "image 5", newsTitle: "At least 16 people were", watched: 5.5, publishTime: "4 min ago"),
    NewsInfos(newsThumbnail: "image 6", newsTitle: "Israel considers steps to deport", watched: 8.5, publishTime: "1 min ago"),
    NewsInfos(newsThumbnail: "image 0", newsTitle: "Israel considers steps to deport", watched: 8.5, publishTime: "5 min ago"),
    NewsInfos(newsThumbnail: "image 1", newsTitle: "Ayman leaves behind swirls", watched: 5.9, publishTime: "7 min ago"),
    NewsInfos(newsThumbnail: "image 2", newsTitle: "At least 16 people were", watched: 6.7, publishTime: "2 min ago"),
    NewsInfos(newsThumbnail: "image 3", newsTitle: "Ayman leaves behind swirls", watched: 7.3, publishTime: "13 min ago"),
    NewsInfos(newsThumbnail: "image 4", newsTitle: "At least 16 people were", watched: 7.9, publishTime: "10 min ago"),
    NewsInfos(newsThumbnail: "image 5", newsTitle: "At least 16 people were", watched: 5.5, publishTime: "4 min ago"),
    NewsInfos(newsThumbnail: "image 6", newsTitle: "Israel considers steps to deport", watched: 8.5, publishTime: "1 min ago"),
    NewsInfos(newsThumbnail: "image 1", newsTitle: "Ayman leaves behind swirls", watched: 5.9, publishTime: "17 min ago"),
    NewsInfos(newsThumbnail: "image 2", newsTitle: "Ayman leaves behind swirls", watched: 6.7, publishTime: "1 min ago"),
    NewsInfos(newsThumbnail: "image 3", newsTitle: "At least 16 people were", watched: 7.3, publishTime: "18 min ago"),
    NewsInfos(newsThumbnail: "image 4", newsTitle: "Ayman leaves behind swirls", watched: 7.9, publishTime: "0 min ago"),
    NewsInfos(newsThumbnail: "image 5", newsTitle: "Israel considers steps to deport", watched: 5.5, publishTime: "0 min ago"),
    NewsInfos(newsThumbnail: "image 0", newsTitle: "At least 16 people were", watched: 8.5, publishTime: "10 min ago"),
    NewsInfos(newsThumbnail: "image 1", newsTitle: "Ayman leaves behind swirls", watched: 5.9, publishTime: "0 min ago"),
    NewsInfos(newsThumbnail: "image 2", newsTitle: "Ayman leaves behind swirls", watched: 6.7, publishTime: "3 min ago"),
    NewsInfos(newsThumbnail: "image 3", newsTitle: "Israel considers steps to deport", watched: 7.3, publishTime: "0 min ago"),
    NewsInfos(newsThumbnail: "image 4", newsTitle: "At least 16 people were", watched: 7.9, publishTime: "22 min ago"),
    NewsInfos(newsThumbnail: "image 5", newsTitle: "Israel considers steps to deport", watched: 5.5, publishTime: "0 min ago")
]

