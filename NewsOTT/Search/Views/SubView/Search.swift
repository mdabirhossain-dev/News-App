//
//  Search.swift
//  OTT App
//
//  Created by Md Abir Hossain on 03-09-2023.
//

import SwiftUI

struct Search: View {
    // MARK: - Properties
    @StateObject var speechRecognizer = SpeechRecognizer.shared
    @State private var isAlert: Bool = false
    @Binding var text: String
    @State private var micIconScale = 1.0
    
    let execute: () -> Void
    
    // MARK: - Body
    var body: some View {
        HStack {
            
            Image("search")
                .resizable()
                .frame(width: 32, height: 32)
            
            if #available(iOS 15.0, *) {
                TextField("", text: $text, onCommit: { execute() })
                    .submitLabel(.search)
                    .modifier(TextFieldStyle(isPlaceHolder: text.isEmpty, placeholder: "search-placeholder-str"))
                    .onChange(of: speechRecognizer.text) { _ in
                        text = speechRecognizer.text
                    }
                    .onTapGesture(perform: {
                        speechRecognizer.stopTranscribing()
                    })
            } else {
                TextField("", text: $text, onCommit: { execute() })
                    .keyboardType(.webSearch)
                    .modifier(TextFieldStyle(isPlaceHolder: text.isEmpty, placeholder: "search-placeholder-str"))
                    .onChange(of: speechRecognizer.text) { _ in
                        text = speechRecognizer.text
                    }
                    .onTapGesture(perform: {
                        speechRecognizer.stopTranscribing()
                    })
            }
            
            Spacer()
            
            if !text.isEmpty {
                Button {
                    text = ""
                    speechRecognizer.stopTranscribing()
                } label: {
                    Image(systemName: "xmark")
                        .font(.system(size: 12, weight: .semibold))
                        .padding(3)
                        .foregroundColor(Color.black.opacity(0.8))
                        .background(Color.gray.opacity(0.5))
                        .clipShape(Circle())
                }
            }
            
            Button {
                // Alert
                isAlert = speechRecognizer.isAlert
                
                withAnimation {
                    speechRecognizer.isRecording.toggle()
                    if speechRecognizer.isRecording {
                        speechRecognizer.transcribe()
                        micIconScale = 1.2
                    } else {
                        speechRecognizer.stopTranscribing()
                        micIconScale = 1.0
                    }
                }
            } label: {
                Image("mic")
                    .font(Font.system(size: 25, weight: .light))
                    .foregroundColor(!speechRecognizer.isRecording ? Color.white : Color.red.opacity(0.8))
                    .frame(width: 25.125, height: 25.125)
                    .shadow(color: .red, radius: !speechRecognizer.isRecording ? 0 : 5)
                    .scaleEffect(micIconScale, anchor: .center)
            }
            .onChange(of: speechRecognizer.isRecording) { _ in
                withAnimation {
                    if speechRecognizer.isRecording {
                        micIconScale = 1.2
                    } else {
                        micIconScale = 1.0
                    }
                }
            }
            .onChange(of: text) { _ in
                if text.count > 0 {
                    text = text[text.startIndex] == " " ? "" : text
                }
            }
        }
        .padding(.horizontal, 16)
        .frame(height: 54)
        .foregroundColor(Color.white)
        .background(Color(red: 0, green: 0.17, blue: 0.71))
        .cornerRadius(30)
        .alert(isPresented: $isAlert) {
            Alert(
                title: Text("error-alert-str"),
                message: Text("speech-recognition-alert-str"),
                primaryButton: .default(Text("Settings")) {
                    UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
                },
                secondaryButton: .cancel()
            )
        }
    }
}

// MARK: - Preview
struct Search_Previews: PreviewProvider {
    @State static var text = ""
    static var previews: some View {
        Search(text: $text, execute: {  })
    }
}

