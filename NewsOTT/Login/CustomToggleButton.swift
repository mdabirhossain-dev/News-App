//
//  CustomToggleButton.swift
//  News OTT Profile
//
//  Created by Tanvir Rahman on 16/10/23.
//

import SwiftUI

struct CustomToggleButton: View {
    @Binding var isToggle: Bool
    
    var body: some View {
        ZStack(alignment: isToggle ? .trailing : .leading){
            Capsule()
                .stroke(.white, lineWidth: 1)
                .frame(width: 24, height: 15)
            Circle()
                .frame(width: 16, height: 15)
                .foregroundColor(isToggle ? .white : Color(red: 0, green: 0.23, blue: 1) )
                .padding([.leading, .trailing], -3)
        }.onTapGesture {
            withAnimation {
                isToggle.toggle()
            }
            
        }
    }
}
