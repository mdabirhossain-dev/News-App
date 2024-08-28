//
//  F_A_Q.swift
//  News OTT Profile
//
//  Created by Tanvir Rahman on 9/10/23.
//

import SwiftUI

struct FrequentlyAskQuestions: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        NavigationView {
            ZStack{
                Color(red: 0.04, green: 0.11, blue: 0.31).ignoresSafeArea()
                ScrollView(.vertical) {
                    VStack(alignment: .center){
                        HStack{
                            Text("FREQUENTLY ASK \nQUESTION")
                                .foregroundColor(Color(red: 0, green: 0.23, blue: 1))
                                .font(.custom(FontManager.Poppins.semiBold, size: 22))
                            Spacer()
                        }.padding(.horizontal, 10)
                            .padding(.bottom)
                        
                        
                        VStack(alignment: .leading) {
                            Text("BINGE- ENTERTAINMENT MADE ENDLESS")
                                .foregroundColor(.white)
                                .font(.custom(FontManager.Poppins.medium, size: 14))
                            
                            Text("WHAT IS BINGE?")
                                .foregroundColor(.white)
                                .font(.custom(FontManager.Poppins.medium, size: 14))
                                .padding(.bottom,15)
                            Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")
                            
                                .foregroundColor(.white)
                                .font(.custom(FontManager.Poppins.medium, size: 10))
                            Text("WHAT SERVICES/ BENEFITS ARE INCLUDED IN BINGE?")
                                .foregroundColor(.white)
                                .font(.custom(FontManager.Poppins.medium, size: 14))
                                .padding(.vertical,15)
                            Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")
                            
                                .foregroundColor(.white)
                                .font(.custom(FontManager.Poppins.medium, size: 10))
                            
                            Text("WHAT ARE THE BINGE SUBSCRIPTION PACKAGE PLANS?")
                                .foregroundColor(.white)
                                .font(.custom(FontManager.Poppins.medium, size: 14))
                                .padding(.vertical,15)
                            
                            Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")
                                .foregroundColor(.white)
                                .font(.custom(FontManager.Poppins.medium, size: 10))
                                .edgesIgnoringSafeArea(.bottom)
                            
                        }
                        .multilineTextAlignment(.leading)
                        .padding(.horizontal, 10)
                    }.padding(.bottom , 100)
                        .multilineTextAlignment(.leading)
                    
                    
                }.padding(.bottom)
                
            }
            .navigationBarItems(leading:
                                    
                                    HStack(spacing: 0){
                
                Button{
                    self.presentationMode.wrappedValue.dismiss()
                }label: {
                    Image("arrow-left")
                        .foregroundColor(.white)
                }
                Text("f-a-q-str")
                    .font(.custom(FontManager.Poppins.semiBold, size: 18))
                    .foregroundColor(.white)
            }
            )
        }.navigationViewStyle(StackNavigationViewStyle())
            .background(Color(red: 0.04, green: 0.11, blue: 0.31).padding(.vertical, -10))
    }
}
