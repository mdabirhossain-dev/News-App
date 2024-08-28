//
//  CustomTextField.swift
//  NewsOTT
//
//  Created by Khaled on 18/10/23.
//

import SwiftUI

struct CustomTextField<Content: View> : View {
    var RectangeHeight: CGFloat
    var textFieldTitle: LocalizedStringKey
    @ViewBuilder let content: Content
    var body: some View {
        content
            .font(.custom("Poppins-Regular", size: 11))
            .foregroundColor(.white)
            .padding(.horizontal, 10)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color(red: 0.75, green: 0.75, blue: 0.75), lineWidth: 1.5)
                    .frame(height: RectangeHeight)
                    .overlay(
                        VStack{
                            HStack{
                                Text(textFieldTitle)
                                    .padding(.horizontal, 6)
                                    .font(.custom("Poppins-SemiBold", size: 13))
                                    .foregroundColor(Color(red: 0.75, green: 0.75, blue: 0.75))
                                    .background(Color(red: 0.04, green: 0.11, blue: 0.31))
                                    .padding(.top, -8.3)
                                    .padding(.leading, 25)
                                    .font(.footnote)
                                Spacer()
                            }
                            Spacer()
                        }
                    )
            )
            .padding(.horizontal, 40)
    }
}
