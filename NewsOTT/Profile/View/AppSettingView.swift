//
//  AppSettingView.swift
//  News OTT Profile
//
//  Created by Tanvir Rahman on 9/10/23.
//

import SwiftUI

struct AppSettingsView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var enterCode: String = ""
    let language: [String] = ["English", "বাংলা"]
    @State private var selectedLanguage: String = "Select your language"
    @State private var isDataSave: Bool = true
    @EnvironmentObject var languageControll : LanguageChangeObserver
    @State private var isSharedAirplay: Bool = false
    var body: some View {
        NavigationView{
            ZStack{
                Color(red: 0.04, green: 0.11, blue: 0.31)
                    .ignoresSafeArea()
                VStack {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(alignment: .leading) {
                            VStack(alignment: .center, spacing: 25) {
                                // Title
                                HStack(spacing: 14) {
                                    Image("connect-tv")
                                        .resizable()
                                        .frame(width: 27/392 * UIScreen.main.bounds.width, height: 24.54/852 * UIScreen.main.bounds.height)
                                    
                                    Text("connect-to-tv-str")
                                        .font(.custom(FontManager.Poppins.bold, size: 16))
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                                
                                // QR Code
                                VStack {
                                    Text("scan-qr-code-str")
                                        .font(.custom(FontManager.Poppins.semiBold, size: 16))
                                    
                                    Text("qr-code-usage-description-str")
                                        .font(.custom(FontManager.Poppins.medium, size: 12))
                                        .multilineTextAlignment(.center)
                                    
                                    Image("QRCode")
                                        .resizable()
                                        .frame(width: 123.5/852 * UIScreen.main.bounds.height, height: 122.5/852 * UIScreen.main.bounds.height)
                                        .padding(.bottom)
                                    Button {
                                        
                                    } label: {
                                        Text("scan-your-qr-code-str")
                                            .font(.custom(FontManager.Poppins.light, size: 12))
                                            .frame(width: 274/392 * UIScreen.main.bounds.width, height: 42/852 * UIScreen.main.bounds.height)
                                            .background(Color(red: 0, green: 0.23, blue: 1))
                                        
                                    }
                                    .cornerRadius(39)
                                    
                                    // Enter your code
                                    TextField("", text: $enterCode)
                                        .padding(.horizontal, 15)
                                        .font(.custom(FontManager.Montserrat.light, size: 12))
                                        .frame(width: 184/392 * UIScreen.main.bounds.width, height: 42/852 * UIScreen.main.bounds.height)
                                        .placeholder(when: enterCode.isEmpty, placeholder: {
                                            Text("enter-your-code-str")
                                                .foregroundColor(.white)
                                                .font(.custom(FontManager.Montserrat.light, size: 12))
                                        })
                                        .multilineTextAlignment(.center)
                                        .background(Color(red: 0.43, green: 0.43, blue: 0.43))
                                        .cornerRadius(39)
                                }
                                
                                // Language
                                VStack {
                                    // Title
                                    HStack(spacing: 14) {
                                        Image("languageIcon")
                                            .resizable()
                                            .frame(width: 27/392 * UIScreen.main.bounds.width, height: 36.08723)
                                        
                                        Text("language-str")
                                            .font(.custom(FontManager.Poppins.bold, size: 16))
                                    }
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    
                                    // Language selection
                                    Menu {
                                        
                                        Button {
                                            DispatchQueue.main.async {
                                                languageControll.languageName = "en"
                                                UserDefaultsManager.shared.set(value: "en", forKey: "localization-language")

                                            }
                                            selectedLanguage = language[0]
                                        } label: {
                                            Text(language[0])
                                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                        }
                                        
                                        Button {
                                            DispatchQueue.main.async {
                                                languageControll.languageName = "bn-BD"
                                                UserDefaultsManager.shared.set(value: "bn-BD", forKey: "localization-language")
                                            }
                                            selectedLanguage = language[1]
                                        } label: {
                                            Text(language[1])
                                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                        }
                                        
                                    } label: {
                                        HStack {
                                            Text(selectedLanguage)
                                                .font(.custom(FontManager.Montserrat.light, size: 12))
                                            
                                            Image("arrow-down")
                                                .resizable()
                                                .frame(width: 7, height: 4)
                                        }
                                        .frame(width: 207.50157/392 * UIScreen.main.bounds.width, height: 36.08723/852 * UIScreen.main.bounds.height)
                                        .background(Color(red: 0.43, green: 0.43, blue: 0.43))
                                        .cornerRadius(39)
                                    }
                                }
                                
                                // Data Saver Mode
                                VStack {
                                    // Title
                                    HStack(spacing: 14) {
                                        Image("dataSaver")
                                            .resizable()
                                            .frame(width: 27/392 * UIScreen.main.bounds.width, height: 24.54/852 * UIScreen.main.bounds.height)
                                        
                                        Text("data-saver-mode-str")
                                            .font(.custom(FontManager.Poppins.bold, size: 16))
                                    }
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    
                                    HStack(spacing: 11) {
                                        Button {
                                            withAnimation {
                                                isDataSave = false
                                            }
                                        } label: {
                                            Text("off-str")
                                                .font(.custom(FontManager.Montserrat.bold, size: 12))
                                                .frame(width: 68/392 * UIScreen.main.bounds.width, height: 36/852 * UIScreen.main.bounds.height)
                                            
                                                .background(!isDataSave ? Color.red : Color(red: 0.43, green: 0.43, blue: 0.43))
                                            
                                        }
                                        .cornerRadius(39)
                                        
                                        Button {
                                            withAnimation {
                                                isDataSave = true
                                            }
                                        } label: {
                                            Text("on-str")
                                                .font(.custom(FontManager.Montserrat.bold, size: 12))
                                                .frame(width: 68/392 * UIScreen.main.bounds.width, height: 36/852 * UIScreen.main.bounds.height)
                                                .background(isDataSave ? Color.red : Color(red: 0.43, green: 0.43, blue: 0.43))
                                        }
                                        .cornerRadius(39)
                                    }
                                }
                            }
                            .padding(.top)
                            Spacer()
                        }.padding(.bottom, 100)
                            .padding(.leading, 11)
                            .foregroundColor(Color.white)
                            .navigationBarBackButtonHidden(true)
                    }.padding(.bottom)
                    Spacer()
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
                                navigationPageTitle(title: "app-settings-str")
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
                if isSharedAirplay {
                    SharedAirplaySwiftUI()
                        .onAppear{
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                                isSharedAirplay = false
                            }
                        }
                }

            }.onTapGesture {
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            }
            .onAppear{
                guard let languageName = UserDefaultsManager.shared.getString(forkey: "localization-language") else {
                    return
                }
    
                languageControll.languageName = languageName 
                if languageName == "bn-BD" {
                    selectedLanguage = language[1]
                }
                if languageName == "en" {
                    selectedLanguage = language[0]
                }
            }
        }.navigationViewStyle(StackNavigationViewStyle())
            .background(Color(red: 0.04, green: 0.11, blue: 0.31).padding(.vertical, -10))
    }
}

struct AppSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        AppSettingsView()
        
    }
}
