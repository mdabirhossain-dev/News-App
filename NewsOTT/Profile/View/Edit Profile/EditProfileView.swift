//
//  EditProfileView.swift
//  News OTT Profile
//
//  Created by Tanvir Rahman on 23/10/23.
//

import SwiftUI

struct EditProfileView: View {
    @State private var ShowImageOption: Bool  = false
    @State private var openCamera: Bool  = false
    @State private var openPhotos: Bool  = false
    @Binding var selectedImage : UIImage
    
    @Binding var firstName: String
    @Binding var lastName: String
    @Binding var birthDate: Date
    @State private var isMale: Bool = true
    @State private var isFemale: Bool = false
    @State private var isOther: Bool = false
    @Environment(\.presentationMode) var presentationMode
    @Binding var countryString: String
    @Binding var cityString: String
    @Binding var areaString: String
    @State private var dateString: String = "DD/MM/YYYY"
    @State private var isNameValid: Bool = false
    @State private var isAlert: Bool = false
    @State private var alertText: LocalizedStringKey = ""
    
    @State private var preFirstName: String = ""
    @State private var preLastName: String = ""
    @State private var isOpenDate: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack{
                Color(red: 0.04, green: 0.11, blue: 0.31)
                    .ignoresSafeArea()
                ScrollView{
                    VStack{
                        ZStack {
                            Circle()
                                .stroke(Color(red: 0, green: 0.23, blue: 1) ,lineWidth: 3)
                                .frame(width: 85, height: 85)
                            Image(uiImage: selectedImage)
                                .resizable()
                                .frame(width: 80,height: 80)
                                .clipShape(Circle())
                                .onTapGesture{
                                    ShowImageOption = true
                                }
                                .actionSheet(isPresented: $ShowImageOption){
                                    ActionSheet(
                                        title: Text("Change Background"),
                                        buttons: [
                                            .default(Text("Open Camera")) {
                                                openCamera = true
                                            },
                                            .default(Text("Open Photos")) {
                                                openPhotos = true
                                            },
                                            .destructive(Text("Cancel")){
                                                //will be just closed
                                            }
                                        ]
                                    )
                                    
                                }
                        }.overlay(
                            HStack{
                                Spacer()
                                VStack {
                                    Spacer()
                                    Image(systemName: "camera")
                                        .resizable()
                                        .frame(width: 11.5, height: 10)
                                        .foregroundColor(.white)
                                        .padding(5)
                                        .background(Color(red: 0, green: 0.23, blue: 1))
                                        .clipShape(Circle())
                                }
                            }.padding(.trailing, 5)
                        )
                        
                        .sheet(isPresented: $openCamera) {
                            ImagePicker(selectedImage: $selectedImage, sourceType: .camera)
                        }
                        .sheet(isPresented: $openPhotos) {
                            ImagePicker(selectedImage: $selectedImage, sourceType: .photoLibrary)
                        }
                        Text("upload-change-photo-str")
                            .foregroundColor(Color(red: 0, green: 0.23, blue: 1))
                            .font(.custom("Montserrat-Medium", size: 12))
                        EditProfileTextFieldCell(title: "first-name-str", content: {
                            TextField("e", text: $firstName)
                                .placeholder(when: firstName.isEmpty,alignment: .leading, placeholder: {
                                    Text("first-name-placeholder-str")
                                        .foregroundColor(.white.opacity(0.8))
                                        .font(.custom(FontManager.Poppins.semiBold, size: 12))
                                })
                        })
                        .onChange(of: firstName) { newValue in
                            isNameValid = validateFirstName(newValue)
                        }
                        .onAppear{
                            if firstName.count >= 1 {
                                isNameValid = true
                            }
                            dateString = birthDate.format(format: "dd/MM/yyyy")
                            preFirstName = firstName
                            preLastName = lastName
                        }
                        
                        EditProfileTextFieldCell(title: "last-name-str", content: {
                            TextField("e", text: $lastName)
                                .placeholder(when: lastName.isEmpty,alignment: .leading, placeholder: {
                                    Text("last-name-placeholder-str")
                                        .foregroundColor(.white.opacity(0.8))
                                        .font(.custom(FontManager.Poppins.semiBold, size: 12))
                                })
                            
                        })
                        
                        HStack{
                            VStack(alignment: .leading){
                                TitleOfEditProfileCells(title: "date-of-birth-str")
                                HStack{
                                    Text(dateString)
                                        .foregroundColor(.white)
                                        .font(.custom(FontManager.Poppins.light, size: 12))
                                        .padding(.horizontal)
                                        .lineLimit(1)
                                        .minimumScaleFactor(0.5)
                                    
                                    Image("calender")
                                        .resizable()
                                        .frame(width: 19, height: 19)
                                }
                                .onTapGesture(perform: {
                                    withAnimation {
                                        isOpenDate = true
                                    }
                                })
                                .padding(.trailing)
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                        .inset(by: 0.5)
                                        .stroke(Color(red: 0, green: 0.23, blue: 1), lineWidth: 1)
                                        .frame(height: 32)
                                )
                            }.onChange(of: birthDate) {  newValue in
                                dateString = birthDate.format(format: "dd/MM/yyyy")
                            }
                            
                            Spacer()
                            
                            VStack(alignment: .leading){
                                TitleOfEditProfileCells(title: "sex-str")
                                HStack{
                                    radioButtonOfEditProfile(isClicked: isMale, buttonName: "male-str")
                                        .onTapGesture {
                                            
                                            withAnimation {
                                                isMale = true
                                                isFemale = false
                                                isOther = false
                                            }
                                            
                                        }
                                    radioButtonOfEditProfile(isClicked: isFemale, buttonName: "female-str")
                                        .onTapGesture {
                                            
                                            withAnimation {
                                                isMale = false
                                                isFemale = true
                                                isOther = false
                                            }
                                            
                                        }
                                    
                                    radioButtonOfEditProfile(isClicked: isOther, buttonName: "other-str")
                                        .onTapGesture {
                                            
                                            withAnimation {
                                                isMale = false
                                                isFemale = false
                                                isOther = true
                                            }
                                        }
                                }
                            }
                            
                        }.padding(.horizontal)
                            .padding(.vertical, 10)
                        HStack{
                            
                            VStack(alignment: .leading, spacing: 5){
                                TitleOfEditProfileCells(title: "country-str")
                                Menu {
                                    ForEach(countryNames(), id: \.self) { country in
                                        Button {
                                            countryString = country
                                        } label: {
                                            Text(country)
                                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                        }
                                    }
                                }label: {
                                    EditProfileDataPickerCell(isFlag: true, labelName: countryString)
                                }
                            }.onChange(of: countryString) {newValue in
                                let citys = cityNames(countryName: countryString)
                                cityString = citys[0]
                            }
                            Spacer()
                            VStack(alignment: .leading, spacing: 5){
                                TitleOfEditProfileCells(title: "city-str")
                                Menu {
                                    ForEach(cityNames(countryName: countryString), id: \.self) { cityName in
                                        Button {
                                            cityString = cityName
                                        }label: {
                                            Text(cityName)
                                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                        }
                                        
                                    }
                                    
                                }label: {
                                    EditProfileDataPickerCell(isFlag: false, labelName: cityString)
                                }
                            }.onChange(of: cityString) {  newValue in
                                let areas = areaNames(cityName: cityString)
                                areaString = areas[0]
                            }
                            
                            Spacer()
                            
                            VStack(alignment: .leading, spacing: 5){
                                TitleOfEditProfileCells(title: "area-str")
                                Menu {
                                    ForEach(areaNames(cityName: cityString), id: \.self) { areaName in
                                        Button {
                                            areaString = areaName
                                        }label: {
                                            Text(areaName)
                                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                        }
                                        
                                    }
                                }label: {
                                    EditProfileDataPickerCell(isFlag: false, labelName: areaString)
                                }
                            }
                        }.padding(.horizontal)
                            .padding(.vertical, 10)
                        
                        Button{
                            if isNameValid && dateString != "DD/MM/YYYY"{
                                self.presentationMode.wrappedValue.dismiss()
                            }else {
                                isAlert = true
                            }
                            if !isNameValid {
                                alertText = "enter-a-valid-first-name-str"
                            } else if dateString == "DD/MM/YYYY" {
                                alertText = "select-a-valid-date-of-birth-str"
                            }
                        }label: {
                            Text("update-str")
                                .foregroundColor(.white)
                                .font(.custom(FontManager.Poppins.bold, size: 18))
                                .background(
                                    Color(red: 0, green: 0.23, blue: 1)
                                        .frame(width: 262, height: 42)
                                        .cornerRadius(10)
                                ).padding()
                            
                        }
                    }.padding(.bottom, 100)
                        .alert(isPresented: $isAlert) {
                            Alert(
                                title: Text("error-alert-str"),
                                message: Text(alertText),
                                dismissButton: .cancel({
                                    alertText = ""
                                })
                            )
                        }
                }.padding(.bottom)
                
                if isOpenDate {
                    ZStack{
                        Color.gray.opacity(0.2)
                            .ignoresSafeArea()
                            .onTapGesture {
                                withAnimation {
                                    isOpenDate = false
                                }
                            }
                        CustomDatePickerView(Dates: $birthDate, isDatePickerEnd: .constant(false))
                    }
                }
            }.onTapGesture {
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            }.navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(leading:
                                        
                                        HStack(spacing: 0){
                    Button{
                        self.presentationMode.wrappedValue.dismiss()
                        firstName = preFirstName
                        lastName = preLastName
                    }label: {
                        Image("arrow-left")
                            .foregroundColor(.white)
                        
                    }
                    navigationPageTitle(title: "edit-profile-nav-str")
                }
                )
        }.navigationViewStyle(StackNavigationViewStyle())
            .background(Color(red: 0.04, green: 0.11, blue: 0.31).padding(.vertical, -10))
    }
    
    func validateFirstName(_ name: String) -> Bool {
        let nameRegex = "^[A-Za-z][A-Za-z0-9 .,!@#$%^&*()-_=+<>/?:;\"'~]*[A-Za-z0-9 .,!@#$%^&*()-_=+<>/?:;\"'~]$"
        let nameTest = NSPredicate(format: "SELF MATCHES %@", nameRegex)
        if nameTest.evaluate(with: name) {
            return true
        }
        return false
    }
}
