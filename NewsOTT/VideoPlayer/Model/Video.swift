//
//  Video.swift
//  AmberIT
//
//  Created by Khaled on 2/10/23.
//

import UIKit

class Video {
    var name: String
    var artist: String
    var url: NSURL
    
    init(name: String, artist: String, url: NSURL) {
        self.name = name
        self.artist = artist
        self.url = url
    }
}

let videos = [Video.init(name: "Big Bunny", artist: "Google", url: NSURL(string: "http://clips.vorwaerts-gmbh.de/VfE_html5.mp4")!),
              Video.init(name: "Robo Toy", artist: "Google", url: NSURL(string: "http://techslides.com/demos/sample-videos/small.mp4")!),
              Video.init(name: "Big Bunny", artist: "Google", url: NSURL(string: "http://clips.vorwaerts-gmbh.de/VfE_html5.mp4")!),
              Video.init(name: "Robo Toy", artist: "Google", url: NSURL(string: "http://techslides.com/demos/sample-videos/small.mp4")!),
              Video.init(name: "Big Bunny", artist: "Google", url: NSURL(string: "http://clips.vorwaerts-gmbh.de/VfE_html5.mp4")!),
              Video.init(name: "Robo Toy", artist: "Google", url: NSURL(string: "http://techslides.com/demos/sample-videos/small.mp4")!),
              Video.init(name: "Big Bunny", artist: "Google", url: NSURL(string: "http://clips.vorwaerts-gmbh.de/VfE_html5.mp4")!),
              Video.init(name: "Robo Toy", artist: "Google", url: NSURL(string: "http://techslides.com/demos/sample-videos/small.mp4")!),
              Video.init(name: "Robo Toy", artist: "Google", url: NSURL(string: "http://techslides.com/demos/sample-videos/small.mp4")!),
              Video.init(name: "Big Bunny", artist: "Google", url: NSURL(string: "http://clips.vorwaerts-gmbh.de/VfE_html5.mp4")!),
              Video.init(name: "Robo Toy", artist: "Google", url: NSURL(string: "http://techslides.com/demos/sample-videos/small.mp4")!),
              Video.init(name: "Big Bunny", artist: "Google", url: NSURL(string: "http://clips.vorwaerts-gmbh.de/VfE_html5.mp4")!),
              Video.init(name: "Robo Toy", artist: "Google", url: NSURL(string: "http://techslides.com/demos/sample-videos/small.mp4")!),
              Video.init(name: "Big Bunny", artist: "Google", url: NSURL(string: "http://clips.vorwaerts-gmbh.de/VfE_html5.mp4")!),
              Video.init(name: "Robo Toy", artist: "Google", url: NSURL(string: "http://techslides.com/demos/sample-videos/small.mp4")!),
              Video.init(name: "Robo Toy", artist: "Google", url: NSURL(string: "http://techslides.com/demos/sample-videos/small.mp4")!)]
