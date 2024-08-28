//
//  SharedAirplaySwiftUI.swift
//  NewsOTT
//
//  Created by Tanvir Rahman on 14/11/23.
//

import Foundation
import SwiftUI
import MediaPlayer
struct SharedAirplaySwiftUI: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        return AirPlayViewController()
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}
