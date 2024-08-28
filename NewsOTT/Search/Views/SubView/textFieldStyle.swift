//
//  textFieldStyle.swift
//  News
//
//  Created by Md Abir Hossain on 18/10/23.
//

import SwiftUI


public struct TextFieldStyle: ViewModifier {
    var isPlaceHolder: Bool
    var placeholder: LocalizedStringKey
    
    public func body(content: Content) -> some View {
        ZStack(alignment: .leading) {
            if isPlaceHolder {
                Text(placeholder)
                    .opacity(0.8)
                    .lineLimit(1)
                    
            }
            content
                .foregroundColor(Color.white)
        }
    }
}

