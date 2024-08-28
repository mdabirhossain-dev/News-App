//
//  ProfileViewDesignHelpers.swift
//  News OTT Profile
//
//  Created by Tanvir Rahman on 26/10/23.
//

import Foundation
import SwiftUI

struct ProfilePageCell: View {
    var imageName: String
    var text: LocalizedStringKey
    
    var body: some View {
        VStack{
            HStack{
                Image(imageName)
                    .resizable()
                    .frame(width: 19, height: 19, alignment: .center)
                Text(text)
                    .font(.custom(FontManager.Poppins.medium, size: 16))
                    .foregroundColor(.white)
                Spacer()
                
                Image("rightArrowSetting")
                    .resizable()
                    .frame(width: 18, height: 18)
                
            }
            Rectangle()
                .frame(height: 1)
                .foregroundColor(Color(red: 0, green: 0.17, blue: 0.71))
            
        }
    }
}

struct InformationSectionCell: View {
    var text: LocalizedStringKey
    var body: some View {
        HStack{
            Text(text)
                .font(.custom(FontManager.Montserrat.medium, size: 12))
                .foregroundColor(.white)
            Spacer()
            Image("rightArrowSetting")
                .resizable()
                .frame(width: 15, height: 15)
            
        }.padding(.leading, 30)
            .padding(.vertical, 5)
    }
}
