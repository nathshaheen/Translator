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
    
    @State var inputLanguageIdentifier: Int = 1
    @State var outputLanguageIdentifier: Int = 2
    
    @State var showInputLanguageSheet = false
    @State var showOutputLanguageSheet = false
    
    var body: some View {
        HStack {
            Spacer()
            
            Button(languages[inputLanguageIdentifier].name) {
                showInputLanguageSheet.toggle()
            }
            .sheet(isPresented: $showInputLanguageSheet) {
                List(languages, id: \.self) { language in
                    Button(language.name) {
                        inputLanguageIdentifier = language.id
                        showInputLanguageSheet.toggle()
                    }
                }
            }
            
            Spacer()
            
            Button("Translate") {
                let options = TranslatorOptions(sourceLanguage: languages[inputLanguageIdentifier].languageIdentifier, targetLanguage: languages[outputLanguageIdentifier].languageIdentifier)
                
                let translator = Translator.translator(options: options)

                let conditions = ModelDownloadConditions(
                    allowsCellularAccess: false,
                    allowsBackgroundDownloading: true
                )
                translator.downloadModelIfNeeded(with: conditions) { error in guard error == nil else { return }
                }

                translator.translate(input) { translatedText, error in guard error == nil, let translatedText = translatedText else { return }
                    print("TRANSLATE", output)
                    output = translatedText
                }
            }
                .padding()
            
            Spacer()
            
            Button(languages[outputLanguageIdentifier].name) {
                showOutputLanguageSheet.toggle()
            }
            .sheet(isPresented: $showOutputLanguageSheet) {
                List(languages, id: \.self) { language in
                    Button(language.name) {
                        outputLanguageIdentifier = language.id
                        showOutputLanguageSheet.toggle()
                    }
                }
            }
            
            Spacer()
        }
            .background(.white)
            .cornerRadius(10)
            .padding()
    }
}

//struct LanguageTranslationView_Previews: PreviewProvider {
//    static var previews: some View {
//        LanguageTranslationView()
//    }
//}
