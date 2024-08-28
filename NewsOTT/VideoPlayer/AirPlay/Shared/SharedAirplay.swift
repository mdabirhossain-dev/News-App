//
//  AirplayConnect.swift
//  NewsOTT
//
//  Created by Tanvir Rahman on 14/11/23.
//

import Foundation
import MediaPlayer

class SharedAirplay {
    static let shared = SharedAirplay()
    
    func showAirPlayMenu(view: UIView){
        let rect = CGRect(x: 0, y: 0, width: 0, height: 0)
        let airplayVolume = MPVolumeView(frame: rect)
        airplayVolume.showsVolumeSlider = false

        view.addSubview(airplayVolume)

        for view: UIView in airplayVolume.subviews {
            if let button = view as? UIButton {
                button.sendActions(for: .touchUpInside)
                break
            }
        }
        airplayVolume.removeFromSuperview()
    }
}

