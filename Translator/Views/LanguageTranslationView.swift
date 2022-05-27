//
//  LanguageTranslationView.swift
//  Translator
//
//  Created by Nathan Shaheen on 24/5/2022.
//

import SwiftUI

import MLKit

struct LanguageTranslationView: View {
    @Binding var input: String
    @Binding var output: String
    
    @State var inputLanguageIdentifier: Int = 3
    @State var outputLanguageIdentifier: Int = 0
    
    @State var showInputLanguageSheet = false
    @State var showOutputLanguageSheet = false
    
    var body: some View {
        HStack {
            Spacer()
            
            // Source lanuage selection
            Button(languages[inputLanguageIdentifier].name) {
                showInputLanguageSheet.toggle()
            }
            .sheet(isPresented: $showInputLanguageSheet) {  // Show list of languages
                List(languages, id: \.self) { language in
                    Button(language.name) {
                        inputLanguageIdentifier = language.id
                        showInputLanguageSheet.toggle()
                    }
                }
            }
            
            Spacer()
            
            // Translate text
            Button("Translate") {
                // Setup Translator
                let options = TranslatorOptions(sourceLanguage: languages[inputLanguageIdentifier].languageIdentifier, targetLanguage: languages[outputLanguageIdentifier].languageIdentifier)
                let translator = Translator.translator(options: options)

                // Download languages if required
                let conditions = ModelDownloadConditions(
                    allowsCellularAccess: false,
                    allowsBackgroundDownloading: true
                )
                translator.downloadModelIfNeeded(with: conditions) { error in guard error == nil else { return }
                }

                // Translate text
                translator.translate(input) { translatedText, error in guard error == nil, let translatedText = translatedText else { return }
                    output = translatedText
                }
            }
            .padding()
            .background(.selection)
            .foregroundColor(.white)
            .clipShape(Capsule())
            
            Spacer()
            
            // Target lanuage selection
            Button(languages[outputLanguageIdentifier].name) {
                showOutputLanguageSheet.toggle()
            }
            .sheet(isPresented: $showOutputLanguageSheet) { // Show list of languages
                List(languages, id: \.self) { language in
                    Button(language.name) {
                        outputLanguageIdentifier = language.id
                        showOutputLanguageSheet.toggle()
                    }
                }
            }
            
            Spacer()
        }
            .background(.ultraThinMaterial)
            .cornerRadius(10)
            .padding()
    }
}

//struct LanguageTranslationView_Previews: PreviewProvider {
//    static var previews: some View {
//        LanguageTranslationView()
//    }
//}
