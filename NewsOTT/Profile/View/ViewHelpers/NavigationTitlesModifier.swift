//
//  NavigationTitlesModifier.swift
//  NewsOTT
//
//  Created by Tanvir Rahman on 8/11/23.
//

import Foundation
import SwiftUI

struct navigationPageTitle: View {
    @State var title: LocalizedStringKey
    var body: some View {
        Text(title)
            .font(.custom(FontManager.Poppins.semiBold, size: 18))
            .foregroundColor(.white)
    }
}
