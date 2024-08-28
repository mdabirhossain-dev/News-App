//
//  SearchResultView.swift
//  OTT App
//
//  Created by Md Abir Hossain on 04-09-2023.
//

import SwiftUI

struct SearchResultView: View {
    // MARK: - Properties
    let showInfo: NewsInfos
    let height: CGFloat
    
    // MARK: - Body
    var body: some View {
        VStack {
            
            Image(showInfo.newsThumbnail)
                .resizable()
                .frame(height: height)
                .cornerRadius(5)
            
            VStack(alignment: .center) {
                // Title
                Text(showInfo.newsTitle)
                    .font(.custom(FontManager.Poppins.medium, size: 9.5))
                    .lineLimit(2)
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                HStack {
                    Image("eye")
                    
                    Text("\(showInfo.watched, specifier: "%.1f")")
                        .font(.custom(FontManager.Poppins.medium, size: 8))
                    
                    Image("dot")
                    
                    Text(showInfo.publishTime)
                        .font(.custom(FontManager.Poppins.medium, size: 8))
                }
            }
        }
        .foregroundColor(Color.white)
        .lineLimit(1)
        .minimumScaleFactor(0.5)
    }
}

// MARK: - Preview
struct SearchResultView_Previews: PreviewProvider {
    static var previews: some View {
        SearchResultView(showInfo: NewsInfos(newsThumbnail: "", newsTitle: "", watched: 1.2, publishTime: "1 min ago"), height: 1.0)
    }
}
