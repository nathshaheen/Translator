//
//  TextTranslationView.swift
//  Translator
//
//  Created by Nathan Shaheen on 24/5/2022.
//

import SwiftUI

struct TextTranslationView: View {
    @State var inputText = "Enter text"
    @State var translatedText = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Rectangle()
                    .frame(height: 0)
                    .background(.white)
                
                TextEditor(text: $inputText)
                    .frame(maxHeight: ContentView.screenHeight * 0.25)
                    .cornerRadius(10)
                    .padding()
                         
                Divider()
                
                ScrollView {
                    Text(" " + translatedText)
                }
                    .frame(maxWidth: .infinity, maxHeight: ContentView.screenHeight * 0.25, alignment: .topLeading)
                    .background(.white)
                    .cornerRadius(10)
                    .padding()
                
                Spacer()
                
                LanguageTranslationView(input: $inputText, output: $translatedText)
                
                Rectangle()
                    .frame(height: 0)
                    .background(.white)
            }
            .background(.ultraThinMaterial)
            .overlay(Rectangle().frame(width: nil, height: 1, alignment: .top).foregroundColor(.secondary.opacity(0.1)), alignment: .top)
            .overlay(Rectangle().frame(width: nil, height: 1, alignment: .bottom).foregroundColor(.secondary.opacity(0.1)), alignment: .bottom)
            .navigationTitle("Text Translation")
        }
    }
}

//struct TextTranslationView_Previews: PreviewProvider {
//    static var previews: some View {
//        TextTranslationView()
//    }
//}
