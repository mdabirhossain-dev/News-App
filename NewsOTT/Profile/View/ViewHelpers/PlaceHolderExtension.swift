//
//  PlaceHolderExtension.swift
//  News OTT Profile
//
//  Created by Tanvir Rahman on 23/10/23.
//

import Foundation
import SwiftUI
extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .center,
        @ViewBuilder placeholder: () -> Content) -> some View {
            
            ZStack(alignment: alignment) {
                placeholder().opacity(shouldShow ? 1 : 0)
                self
            }
        }
}
