//
//  WatchListModel.swift
//  News OTT Profile
//
//  Created by Tanvir Rahman on 10/10/23.
//

import Foundation

struct MyWishlist {
    let id = UUID()
    let showTitle: String?
    let thumbUrl: String?
    let watchedDuration: Double?
    let showDuration: String?
    let currentItem: Int
}


let myWatchlist: [MyWishlist] = [
    MyWishlist(showTitle: "Maya Shalik", thumbUrl: "watchlist01", watchedDuration: 0.3, showDuration: "2h 17m remaining", currentItem: 0),
    MyWishlist(showTitle: "Judas", thumbUrl: "watchlist02", watchedDuration: 0.5, showDuration: "1h 17m remaining", currentItem: 1),
    MyWishlist(showTitle: "The Silence", thumbUrl: "watchlist03", watchedDuration: 0.2, showDuration: "17m remaining", currentItem: 2),
    MyWishlist(showTitle: "Infinity", thumbUrl: "watchlist04", watchedDuration: 0.8, showDuration: "50m remaining", currentItem: 3),
    MyWishlist(showTitle: "Friday", thumbUrl: "watchlist05", watchedDuration: 0.4, showDuration: "2h 34m remaining", currentItem: 4),
    MyWishlist(showTitle: "Sholey", thumbUrl: "watchlist06", watchedDuration: 0.6, showDuration: "1h 20m remaining", currentItem: 5)
]
