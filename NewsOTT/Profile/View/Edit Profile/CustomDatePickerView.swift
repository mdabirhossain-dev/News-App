//
//  CustomDatePickerView.swift
//  NewsOTT
//
//  Created by Khaled on 29/10/23.
//

import Foundation
import SwiftUI

struct CustomDatePickerView: View {
    @Binding var Dates: Date
    @Binding var isDatePickerEnd: Bool
    var body: some View {
        VStack{
            DatePicker("", selection: $Dates.animation(), in: ...Date(), displayedComponents: .date)
                .datePickerStyle(.wheel)
                .labelsHidden()
                .padding()
        }
        .background(
            Color.black
                .cornerRadius(10)
                .padding()
        )
        .preferredColorScheme(.dark)
    }
}
