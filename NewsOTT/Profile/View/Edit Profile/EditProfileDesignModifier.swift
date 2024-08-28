//
//  EditProfileDesignModifier.swift
//  News OTT Profile
//
//  Created by Tanvir Rahman on 23/10/23.
//

import SwiftUI
import Foundation

struct EditProfileTextFieldCell<Content: View>: View {
    @State var title: LocalizedStringKey
    @ViewBuilder let content: Content
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15){
            Text(title)
                .font(.custom(FontManager.Poppins.semiBold, size: 14))
                .foregroundColor(Color.white)
            content
                .foregroundColor(.white)
                .font(.custom(FontManager.Poppins.semiBold, size: 12))
                .padding(.horizontal, 10)
                .keyboardType(.default)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .inset(by: 0.5)
                        .stroke(Color(red: 0, green: 0.23, blue: 1), lineWidth: 1)
                        .frame(height: 35)
                )
            
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
    }
}

struct radioButtonOfEditProfile: View{
    var isClicked: Bool
    @State var buttonName: LocalizedStringKey
    var body: some View {
        HStack(spacing: 5){
            ZStack{
                Circle()
                    .stroke(Color(red: 0, green: 0.23, blue: 1) ,lineWidth: 2)
                    .frame(width: 12, height: 12)
                if isClicked {
                    Circle()
                        .frame(width: 7, height: 7)
                        .foregroundColor(Color(red: 0, green: 0.23, blue: 1))
                }
            }
            Text(buttonName)
                .foregroundColor(.white)
                .font(.custom(FontManager.Poppins.medium, size: 12))
                .lineLimit(1)
                .minimumScaleFactor(0.5)
            
        }
    }
}

struct EditProfileDataPickerCell: View {
    @State var isFlag: Bool
    var labelName: String
    var body: some View {
        HStack{
            Image("arrow-down")
                .resizable()
                .frame(width: 8, height: 3)
            if isFlag {
                if let _ = UIImage(named: labelName) {
                    Image(labelName)
                        .resizable()
                        .frame(width: 18, height: 10.28572)
                }else {
                    Image("world-demo-flag")
                        .resizable()
                        .frame(width: 18, height: 10.28572)
                    
                }
            }
            Text(labelName)
                .font(.custom(FontManager.Poppins.medium, size: 12))
                .foregroundColor(.white)
        }.padding(.horizontal)
            .padding(.vertical, 10)
            .frame(width: (UIScreen.main.bounds.width / 3) - 10)
            .background(
                
                RoundedRectangle(cornerRadius: 10)
                    
                    .inset(by: 0.5)
                    .stroke(Color(red: 0, green: 0.23, blue: 1), lineWidth: 1)
            )
            .lineLimit(1)
            .minimumScaleFactor(1/2)
    }
}
struct TitleOfEditProfileCells: View {
    @State var title: LocalizedStringKey
    var body: some View {
        Text(title)
            .font(.custom(FontManager.Poppins.semiBold, size: 14))
            .foregroundColor(Color.white)
        
    }
}

