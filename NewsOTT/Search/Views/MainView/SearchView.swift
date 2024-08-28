//
//  SearchView.swift
//  OTT App
//
//  Created by Md Abir Hossain on 03-09-2023.
//

import SwiftUI
import UIKit
import Speech

// Swearch Colums
let columns = [
    GridItem(),
    GridItem(),
    GridItem()
]

struct SearchView: View {
    // MARK: - Properties
    @State var text = ""
    
    @Environment(\.presentationMode) var presentation
    
    // MARK: - Functions
    // Filter
    var filterShows: [NewsInfos] {
        if text.isEmpty {
            return showInfos
        } else {
            let str = text
            return showInfos.filter { ($0.newsTitle).localizedCaseInsensitiveContains(str)
            }
        }
    }
    @StateObject var languageViewModel = LanguageChangeObserver()

    private func setupCustomPlayer() {
        let vc = DetailPlayerViewController.instantiate()
        guard let url = NSURL(string: "http://clips.vorwaerts-gmbh.de/VfE_html5.mp4") else { return }
        CustomPlayer.initCustomPlayer(url: url)
        CustomPlayer.showCustomPlayerView(viewController: vc)
    }
    
    @State private var languageSelect: String = "en"
    
    // MARK: - Body
    var body: some View {
        NavigationView {
            GeometryReader { geo in
                VStack(alignment: .leading) {
                    
                    Search(text: $text, execute: { addRecent(recent: text) })
                        .padding(.horizontal, 16)
                        .environmentObject(LanguageChangeObserver())
                    ScrollView(.vertical, showsIndicators: false) {
                        if text.isEmpty {
                            VStack(alignment: .leading) {
                                // Recent
                                if searchHistory.count > 0 {
                                    Section {
                                        HStack {
                                            Text("Recent")
                                                .font(.custom(FontManager.Montserrat.bold, size: 24))
                                            
                                            Spacer()
                                            
                                            Text("See All")
                                                .font(.custom(FontManager.Montserrat.light, size: 16))
                                                .foregroundColor(Color(red: 0, green: 0.23, blue: 1))
                                        }
                                        
                                        ForEach(0 ..< searchHistory.count, id: \.self) { index in
                                            HStack {
                                                Image("clock-rewind")
                                                
                                                Text(searchHistory[index])
                                                    .foregroundColor(Color.white)
                                            }
                                            .onTapGesture {
                                                text = searchHistory[index]
                                            }
                                        }
                                    }
                                }
                                
                                // Top Searches
                                Section {
                                    Text("Top Searches")
                                        .font(.custom(FontManager.Poppins.medium, size: 22))
                                    
                                    LazyVGrid(columns: columns, spacing: 20) {
                                        ForEach(0 ..< recommendedShows.count, id: \.self) { index in
                                            SearchResultView(showInfo: recommendedShows[index], height: geo.size.width / 2)
                                                .onTapGesture(perform: {
                                                    print("Top Searches index \(index)")
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
                                                })
                                        }
                                    }
                                }
                            }
                            .padding(.bottom, 100)
                        } else {
                            VStack(alignment: .leading) {
                                Text("Results")
                                    .font(.custom(FontManager.Poppins.medium, size: 22))
                                
                                if filterShows.count > 0 {
                                    LazyVGrid(columns: columns, spacing: 20) {
                                        ForEach(0 ..< filterShows.count, id: \.self) { index in
                                            SearchResultView(showInfo: filterShows[index], height: geo.size.width / 2)
                                                .onTapGesture(perform: {
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
                                                })
                                        }
                                    }
                                } else {
                                    VStack(alignment: .leading, spacing: 5) {
                                        VStack {
                                            Image("xmarkCircle")
                                                .font(.system(size: 54, weight: .bold))
                                            
                                            Text("Sorry! No Results Found")
                                                .font(.custom(FontManager.Poppins.medium, size: 14))
                                        }
                                        .frame(maxWidth: .infinity, alignment: .center)
                                        
                                        VStack(alignment: .leading) {
                                            Text("Recommended Shows")
                                                .font(.custom(FontManager.Poppins.medium, size: 22))
                                            
                                            LazyVGrid(columns: columns, spacing: 20) {
                                                ForEach(0 ..< recommendedShows.count, id: \.self) { index in
                                                    SearchResultView(showInfo: recommendedShows[index], height: geo.size.width / 2)
                                                        .onTapGesture(perform: {
                                                            print("Recommended News index \(index)")
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
                                                        })
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                            .padding(.bottom, 75)
                        }
                    }
                    .padding(.horizontal, 16)
                }
                .onTapGesture(perform: {
                    hideKeyboard()
                })
            }
            .preferredColorScheme(.dark)
            .background(
                Color(red: 0.04, green: 0.11, blue: 0.31).ignoresSafeArea(.all)
            )
            .foregroundColor(Color.white)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true)
            .onAppear{
                guard let languageKey = UserDefaultsManager.shared.getString(forkey: "localization-language") else {
                    return
                }
                languageSelect = languageKey
            }
        }.navigationViewStyle(StackNavigationViewStyle())
            .environment(\.locale, Locale.init(identifier: languageSelect))
    }
}

// MARK: - Preview
struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
