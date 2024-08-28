//
//  NotificationView.swift
//  News OTT Profile
//
//  Created by Tanvir Rahman on 11/10/23.
//

import SwiftUI


import SwiftUI

struct NotificationsView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State private var isLoading: Bool = false
    @State private var isSharedAirplay: Bool = false
    var body: some View {
        NavigationView{
            ZStack{
                Color(red: 0.04, green: 0.11, blue: 0.31)
                    .ignoresSafeArea()
                    ScrollView{
                        LazyVStack {
                        ForEach(0..<20) { i in
                                Button{
                                    print("Notification Index \(i)")
                                }label: {
                                    
                                    ZStack{
                                        HStack(alignment: .center){
                                            Image("v\(i%4)")
                                                .resizable()
                                                .frame(width: 94, height: 64)
                                                .cornerRadius(10)
                                                .scaledToFit()
                                            VStack(alignment: .leading, spacing: 5){
                                                Text("Payment Successful")
                                                    .font(.custom(FontManager.Montserrat.medium, size: 13))
                                                    .foregroundColor(.white)
                                                VStack(alignment: .leading){
                                                    Text("Play The Trailer")
                                                        .font(.custom(FontManager.Montserrat.medium, size: 12))
                                                        .foregroundColor(.white)
                                                    Text("May 23")
                                                        .font(.custom(FontManager.Montserrat.medium, size: 13))
                                                        .foregroundColor(.white)
                                                }
                                            }
                                            Spacer()
                                            Button{
                                                print("Notification Vertical Dot \(i)")
                                            }label: {
                                                Image("more-vertical")
                                                    .resizable()
                                                    .frame(width: 12, height: 12)
                                            }
                                            
                                        }
                                    }.padding(.horizontal, 5)
                                }
                        }
                        }.padding(.bottom, 100)
                            
                    }.padding(.bottom)
                if isLoading{
                    ZStack{
                        Color.gray.opacity(0.3)
                            .ignoresSafeArea()
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                            .scaleEffect(2)
                    }
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
                                navigationPageTitle(title: "notification-nav-str")
                            }

                        }
                        ToolbarItem(placement: .navigationBarTrailing) {
                            HStack{
                                Button{
                                    withAnimation {
                                        isSharedAirplay = true
                                    }
                                }label: {
                                    Image("cast")
                                        .resizable()
                                        .frame(width: 24, height: 18)
                                        .padding(.horizontal, 14)
                                        .foregroundColor(Color.white)
                                }
                                
                                Button{
                                    isLoading = true
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                                        isLoading = false
                                    }
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
