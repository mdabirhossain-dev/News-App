//
//  MyWatchlistItemView.swift
//  Amber IT Profile
//
//  Created by Md Abir Hossain on 8/10/23.
//

import SwiftUI

struct MyWatchlistItemView: View {

    let myWishlist: MyWishlist
    var body: some View {
        ZStack {
            Color(red: 0, green: 0.23, blue: 1)
                .ignoresSafeArea(.all)
                .cornerRadius(5)
            
            
            VStack(spacing: 0) {
                //Thumb Image
                Image(myWishlist.thumbUrl ?? "")
                    .resizable()
                    .frame(maxWidth: .infinity)
                    .frame(height: 171/852 * UIScreen.main.bounds.height)
                    .cornerRadius(5)
                
                HStack(alignment: .center) {
                    VStack(alignment: .leading, spacing: 4/852 * UIScreen.main.bounds.height) {
                        //Show Title
                        Text("\(myWishlist.showTitle ?? "")".uppercased())
                            .font(.custom(FontManager.Poppins.medium, size: 10))
                        
                        //Progress bar
                        ProgressViewData(progressPercentasge: myWishlist.watchedDuration ?? 0.0)
                        
                        //Total Duration
                        Text(myWishlist.showDuration ?? "")
                            .font(.custom(FontManager.Montserrat.medium, size: 7))
                            .padding(.top, -5)
                    }
                    
                    //Play Button
                    
                        Image("bluePlay")
                            .resizable()
                            .frame(width: 20.66/392 * UIScreen.main.bounds.width, height: 20.66/392 * UIScreen.main.bounds.width)

                    
                }
                .padding([.horizontal, .vertical], 7/852 * UIScreen.main.bounds.height)
                .foregroundColor(Color.white)
            }
        }
        .cornerRadius(5)
    }
}

// MARK: - Properties
struct MyWatchlistItemView_Previews: PreviewProvider {
    static var previews: some View {
        MyWatchlistItemView(myWishlist: MyWishlist(showTitle: "", thumbUrl: "", watchedDuration: 0.0, showDuration: "", currentItem: 0))
    }
}
