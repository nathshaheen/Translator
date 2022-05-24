//
//  TextTranslationView.swift
//  Translator
//
//  Created by Nathan Shaheen on 24/5/2022.
//

import SwiftUI

struct TextTranslationView: View {
    @State var inputText = ""
    @State var translatedText = ""
    
    @State var placeholder = "Enter text"
    
    init() {
        UITextView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Rectangle()
                    .frame(height: 0)
                    .background(.ultraThinMaterial)
                
                ZStack {
                    if self.inputText.isEmpty {
                        TextEditor(text: $placeholder)
                            .foregroundColor(.secondary)
                            .disabled(true)
                            .frame(maxHeight: ContentView.screenHeight * 0.25)
                            .background(.ultraThinMaterial)
                            .cornerRadius(10)
                    }
                    TextEditor(text: $inputText)
                        .foregroundColor(.primary)
                        .frame(maxHeight: ContentView.screenHeight * 0.25)
                        .background(.ultraThinMaterial)
                        .cornerRadius(10)
                        .opacity(self.inputText.isEmpty ? 0.25 : 1)
                        .onTapGesture {
                            endEditing()
                        }
                }
                .padding()
                         
                Divider()
                
                ScrollView {
                    Text(translatedText)
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                        .padding(5)
                }
                    .frame(maxWidth: .infinity, maxHeight: ContentView.screenHeight * 0.25, alignment: .topLeading)
                    .background(.ultraThinMaterial)
                    .cornerRadius(10)
                    .padding()
                
                Spacer()
                
                LanguageTranslationView(input: $inputText, output: $translatedText)
                
                Rectangle()
                    .frame(height: 0)
                    .background(.ultraThinMaterial)
            }
            .overlay(Rectangle().frame(width: nil, height: 1, alignment: .top).foregroundColor(.secondary.opacity(0.1)), alignment: .top)
            .overlay(Rectangle().frame(width: nil, height: 1, alignment: .bottom).foregroundColor(.secondary.opacity(0.1)), alignment: .bottom)
            .navigationTitle("Text Translation")
        }
    }
    
    private func endEditing() {
        UIApplication.shared.endEditing()
    }
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

//struct TextTranslationView_Previews: PreviewProvider {
//    static var previews: some View {
//        TextTranslationView()
//    }
//}
