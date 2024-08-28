//
//  CreateAccountView.swift
//  News OTT Profile
//
//  Created by Tanvir Rahman on 9/10/23.
//

import SwiftUI

struct CreateAccountView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var rememberMe: Bool = false
    
    var body: some View {
        NavigationView{
            ZStack{
                Color(red: 0.04, green: 0.11, blue: 0.31)
                    .ignoresSafeArea()
                VStack(alignment: .center){
                    Spacer()
                    Image("NEWSLOGO")
                        .resizable()
                        .frame(width: 123, height: 103.5)
                        .aspectRatio(164/138, contentMode: .fit)

                   Spacer()
                    VStack(alignment: .leading) {
                        Text("sign-up-str")
                            .foregroundColor(.white)
                            .font(.custom("Poppins-SemiBold", size: 22))
                            .padding(.leading, 35)
                            .padding(.bottom, 20)
                        CustomTextField(RectangeHeight: 49, textFieldTitle: "email-str", content: {
                            TextField(" ", text: $email)
                                .keyboardType(.emailAddress)
                                .textContentType(.emailAddress)
                        })
                        
                        CustomTextField(RectangeHeight: 49, textFieldTitle: "password-str") {
                            SecureField(" ", text: $password)
                                .foregroundColor(.white)
                        }.padding(.top, 50)
                        CustomTextField(RectangeHeight: 49, textFieldTitle: "confirm-password-str") {
                            SecureField(" ", text: $confirmPassword)
                                .foregroundColor(.white)
                            
                        }.padding(.top, 50)
                        HStack{
                            HStack{
                                CustomToggleButton(isToggle: $rememberMe)
                                Text("remember-me-str")
                                    .font(.custom("Poppins-Regular", size: 11))
                                    .foregroundColor(.white)
                            }
                            
                            Spacer()
                            
                            Text("forgot-password-str")
                                .font(Font.custom("Poppins-Regular", size: 11))
                                .underline()
                                .foregroundColor(Color(red: 0, green: 0.23, blue: 1))
                            
                        }.padding(.top, 30)
                            .padding(.horizontal, 43)
                    }
                    NavigationLink {
                        TabBarContollerWrapper()
                            .ignoresSafeArea()
                            .navigationBarBackButtonHidden(true)
                    }label: {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame( height: 49)
                            .background(Color(red: 0, green: 0.17, blue: 0.71))
                            .cornerRadius(10)
                            .shadow(color: .black.opacity(0.25), radius: 5)
                            .overlay(
                                Text("sign-up-str")
                                    .font(
                                        Font.custom("Poppins-SemiBold", size: 22)
                                            .weight(.semibold)
                                    )
                                    .foregroundColor(.white)
                            )
                    }.padding(.top)
                        .padding(.horizontal, 40)
                    
                    HStack{
                        Text("Have an account?")
                            .font(.custom("Poppins-Regular", size: 13))
                            .foregroundColor(.white)
                        NavigationLink {
                            LoginView()
                                .navigationBarBackButtonHidden(true)
                        }label: {
                            Text("login-str")
                                .underline()
                                .font(.custom("Poppins-Regular", size: 13))
                                .foregroundColor(Color(red: 0, green: 0.23, blue: 1))
                            
                        }
                    }.padding(.vertical)
                    
                    Rectangle()
                        .frame(height: 0.5)
                        .foregroundColor(.white)
                        .padding(.horizontal)
                        .overlay(
                            Text("or-continue-with-str")
                                .padding(.horizontal, 5)
                                .foregroundColor(.white)
                                .font(.custom("Poppins-Regular", size: 13))
                                .background(Color(red: 0.04, green: 0.11, blue: 0.31))
                        )
                    HStack{
                        Image("facebookLogo")
                            .resizable()
                            .frame(width: 57, height: 44)
                            .padding()
                        Image("googleLogo")
                            .resizable()
                            .frame(width: 41, height: 44)
                            .padding()
                        Image("appleLogo")
                            .resizable()
                            .frame(width: 34, height: 44)
                            .padding()
                        Image("otpLogo")
                            .resizable()
                            .frame(width: 33, height: 45)
                            .padding()
                        
                    }.padding(.bottom)
                    Spacer()
                }
            }.onTapGesture {
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            }
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}
