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
        UITextView.appearance().backgroundColor = .clear    // Change default TextEditor styling
    }
    
    var body: some View {
        NavigationView {
            VStack {
                // Background for header
                Rectangle()
                    .frame(height: 0)
                    .background(.ultraThinMaterial)
                
                // Text input
                ZStack {
                    if self.inputText.isEmpty { // Show "dummy" TextEditor when the is no input
                        TextEditor(text: $placeholder)
                            .foregroundColor(.secondary)
                            .disabled(true)
                            .frame(maxHeight: ContentView.screenHeight * 0.25)
                            .background(.ultraThinMaterial)
                            .cornerRadius(10)
                    }
                    TextEditor(text: $inputText)    // "Real" TextEditor
                        .foregroundColor(.primary)
                        .frame(maxHeight: ContentView.screenHeight * 0.25)
                        .background(.ultraThinMaterial)
                        .cornerRadius(10)
                        .opacity(self.inputText.isEmpty ? 0.25 : 1)
                        .onTapGesture {
                            endEditing()    // Dismiss keyboard
                        }
                }
                .padding()
                         
                Divider()
                
                // Text output
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
                
                // Language selection and translation functionalaity
                LanguageTranslationView(input: $inputText, output: $translatedText)
                
                // Background for footer
                Rectangle()
                    .frame(height: 0)
                    .background(.ultraThinMaterial)
            }
            // Border styling for header and footer
            .overlay(Rectangle().frame(width: nil, height: 1, alignment: .top).foregroundColor(.secondary.opacity(0.1)), alignment: .top)
            .overlay(Rectangle().frame(width: nil, height: 1, alignment: .bottom).foregroundColor(.secondary.opacity(0.1)), alignment: .bottom)
            .navigationTitle("Text Translation")
        }
    }
    
    // Dismisses keyboard
    private func endEditing() {
        UIApplication.shared.endEditing()
    }
}

// Dismisses keyboard
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
