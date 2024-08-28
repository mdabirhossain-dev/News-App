//
//  ContentView.swift
//  News OTT Profile
//
//  Created by Tanvir Rahman on 8/10/23.
//

import SwiftUI

struct ProfileContentView: View {
    @State private var isInformation: Bool = false
    @State var selectedImage : UIImage = UIImage(named: "maleProfile")!
    @State var firstName: String = "MD. Mahfuzul"
    @State var lastName: String = "Islam"
    @State var dateOfBirth: Date = Date()
    @State var country: String = "Country"
    @State var city: String = "City"
    @State var area: String = "Area"
    @StateObject var languageViewModel = LanguageChangeObserver()
    @Environment(\.presentationMode) var presentationMode
    @State private var isSharedAirplay: Bool = false
    var body: some View {
        NavigationView{
            ZStack{
                Color(red: 0.04, green: 0.11, blue: 0.31)
                    .ignoresSafeArea()
                ScrollView{
                    VStack{
                        Rectangle()
                            .frame(height: 101)
                            .foregroundColor(Color(red: 0, green: 0.23, blue: 1))
                            .overlay(
                                VStack{
                                    Image(uiImage: selectedImage)
                                        .resizable()
                                        .frame(width: 103, height: 103)
                                        .overlay(
                                            Circle()
                                                .stroke(Color(red: 0, green: 0.23, blue: 1), lineWidth: 4)
                                        ).clipped()
                                        .clipShape(
                                            Circle()
                                        )
                                        .shadow(color: .black.opacity(0.5),radius: 6)
                                    Text("\(firstName) \(lastName)")
                                        .font(.custom(FontManager.Poppins.medium, size: 16))
                                        .foregroundColor(.white)
                                    NavigationLink{
                                        EditProfileView(selectedImage: $selectedImage, firstName: $firstName ,lastName: $lastName, birthDate: $dateOfBirth,countryString: $country, cityString: $city, areaString: $area)
                                            .navigationBarBackButtonHidden(true)
                                            .environmentObject(languageViewModel)
                                    }label: {
                                        Text("edit-profile-str")
                                            .padding(3)
                                            .padding(.horizontal, 5)
                                            .font(.custom(FontManager.Poppins.medium, size: 12))
                                            .foregroundColor(.white)
                                            .background(
                                                Rectangle()
                                                    .foregroundColor(Color(red: 0, green: 0.23, blue: 1))
                                                    .cornerRadius(18.5)
                                                    .shadow(color: .black.opacity(0.3),radius: 3)
                                            )
                                    }
                                }.padding(.bottom, 48)
                            ).padding(.top, 70)
                        VStack{
                            NavigationLink(destination:
                                            AppSettingsView()
                                .navigationBarBackButtonHidden(true)
                                .navigationBarHidden(true)
                                .environmentObject(languageViewModel)
                            ) {
                                ProfilePageCell(imageName: "settings", text: "app-settings-str")
                            }
                            NavigationLink(destination:
                                            MyWishlistView()
                                .navigationBarBackButtonHidden(true)
                                .navigationBarHidden(true)
                            ) {
                                ProfilePageCell(imageName: "myWatchList", text:"my-watchlist-str")
                            }
                            
                            VStack{
                                Button{
                                    withAnimation {
                                        isInformation.toggle()
                                    }
                                }label: {
                                    VStack{
                                        HStack{
                                            
                                            Image("information")
                                                .resizable()
                                                .frame(width: 19, height: 19, alignment: .center)
                                            
                                            Text("information-str")
                                                .font(.custom(FontManager.Poppins.medium, size: 16))
                                                .foregroundColor(.white)
                                            Spacer()
                                            
                                            Image("rightArrowSetting")
                                                .resizable()
                                                .frame(width: 18, height: 18)
                                                .rotationEffect(isInformation ? .degrees(90) : .degrees(0))
                                            
                                        }
                                    }
                                }
                                
                                if isInformation {
                                    NavigationLink {
                                        Terms_And_Conditions().navigationBarBackButtonHidden(true)
                                            .environmentObject(languageViewModel)
                                    } label: {
                                        InformationSectionCell(text: "t-&-c-str")
                                    }
                                    NavigationLink{
                                        FrequentlyAskQuestions().navigationBarBackButtonHidden(true)
                                            .environmentObject(languageViewModel)
                                        
                                    }label: {
                                        InformationSectionCell(text: "f-a-q-str")
                                    }
                                    
                                    NavigationLink{
                                        PrivacyNotice().navigationBarBackButtonHidden(true)
                                            .environmentObject(languageViewModel)
                                        
                                    }label: {
                                        InformationSectionCell(text: "privacy-notice-str")
                                        
                                    }
                                }
                                Rectangle()
                                    .frame(height: 1)
                                    .foregroundColor(Color(red: 0, green: 0.17, blue: 0.71))
                            }
                        }.padding()
                            .padding(.top, 50)
                        VStack(spacing: 20){
                            Button{
                                self.presentationMode.wrappedValue.dismiss()
                            }label: {
                                Text("log-out-str")
                                    .foregroundColor(.white)
                                    .font(.custom(FontManager.Montserrat.medium, size: 14))
                                    .background(
                                        Color(red: 0, green: 0.23, blue: 1)
                                            .frame(width: 328, height: 42)
                                            .cornerRadius(13)
                                    )
                            }
                            VStack{
                                Button{
                                    
                                }label: {
                                    Text("delete-account-str")
                                        .font(.custom(FontManager.Poppins.semiBold, size: 12))
                                        .underline()
                                        .foregroundColor(Color(red: 0, green: 0.23, blue: 1))
                                }
                                
                                
                                
                                Text("app-version-str")
                                    .font(Font.custom(FontManager.Poppins.regular, size: 10))
                                    .foregroundColor(.white)
                            }
                            
                        }.padding(.top, 40)
                        Spacer()
                    }
                    if isSharedAirplay {
                        SharedAirplaySwiftUI()
                            .onAppear{
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                                     isSharedAirplay = false
                                }
                            }
                    }
                }.padding(.bottom)
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar{
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
                                
                                NavigationLink{
                                    NotificationsView()
                                        .navigationBarHidden(true)
                                        .environmentObject(languageViewModel)
                                }label: {
                                    Image("notification")
                                        .resizable()
                                        .foregroundColor(Color.white)
                                }
                                
                            }
                        }
                    }
                
            }
        }.navigationViewStyle(.stack)
            .background(Color(red: 0.04, green: 0.11, blue: 0.31).padding(.vertical, -10))
            .environmentObject(languageViewModel)
            .environment(\.locale, Locale.init(identifier: UserDefaultsManager.shared.getString(forkey: "localization-language") ?? languageViewModel.languageName))
    }
}
