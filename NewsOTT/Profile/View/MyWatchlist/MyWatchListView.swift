//
//  MyWatchListView.swift
//  News OTT Profile
//
//  Created by Tanvir Rahman on 10/10/23.
//

import Foundation
import SwiftUI

let columnsWatchList = [
    GridItem(),
    GridItem(),
    GridItem()
]

struct MyWishlistView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State private var isSharedAirplay: Bool = false
    private func setupCustomPlayer() {
        let vc = DetailPlayerViewController.instantiate()
        guard let url = NSURL(string: "http://clips.vorwaerts-gmbh.de/VfE_html5.mp4") else { return }
        CustomPlayer.initCustomPlayer(url: url)
        CustomPlayer.showCustomPlayerView(viewController: vc)
    }
    
    var body: some View {
        NavigationView{
            
            ZStack{
                Color(red: 0.04, green: 0.11, blue: 0.31).ignoresSafeArea()
                VStack {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: columnsWatchList, spacing: 21) {
                            ForEach(0 ..< myWatchlist.count, id: \.self) { index in
                                
                                    MyWatchlistItemView(myWishlist: myWatchlist[index])
                                    .onTapGesture {
                                        print("WatchList: \(index)")
                                        if CustomPlayer.getPlayerViewController() != nil {
                                            guard let url = NSURL(string: "http://clips.vorwaerts-gmbh.de/VfE_html5.mp4") else { return }
                                            CustomPlayer.changeURL(url: url)
                                            CustomPlayer.expandView(expand: true)
                                        } else {
                                            setupCustomPlayer()
                                        }
                                        let vc = DetailPlayerViewController.instantiate()
                                        vc.isTV = false
                                        CustomPlayer.isLive(isLive: false)
                                        CustomPlayer.add_ViewController(viewController: vc)
                                    }
                            }
                        }
                    }.padding(.bottom)
                    .padding(.horizontal, 18)
                }
                if isSharedAirplay {
                    SharedAirplaySwiftUI()
                        .onAppear{
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                                isSharedAirplay = false
                            }
                        }
                }
                

            }.navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    HStack(spacing: 0){
                        Button{
                            self.presentationMode.wrappedValue.dismiss()
                        }label: {
                            Image("arrow-left")
                                .foregroundColor(.white)
                            
                        }
                        navigationPageTitle(title: "my-watchlist-str")
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack{
                        Button{
                            isSharedAirplay = true
                        }label: {
                            Image("cast")
                                .resizable()
                                .frame(width: 24, height: 18)
                                .padding(.horizontal, 14)
                                .foregroundColor(Color.white)
                        }
                        NavigationLink{
                            NotificationsView()
                                .navigationBarBackButtonHidden(true)
                                .navigationBarHidden(true)

                        }label: {
                            Image("notification")
                                .resizable()
                                .foregroundColor(Color.white)
                        }
                    }
                }
            }
        }.navigationViewStyle(StackNavigationViewStyle())
         .background(Color(red: 0.04, green: 0.11, blue: 0.31).padding(.vertical, -10))
    }
}

// MARK: - Preview
struct MyWishlistView_Previews: PreviewProvider {
    static var previews: some View {
        MyWishlistView()
    }
}
