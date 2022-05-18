//
//  LanguageSelectorView.swift
//  Translator
//
//  Created by Nathan Shaheen on 25/4/2022.
//

import SwiftUI

import MLKit

struct LanguageSelectorView: View {
    @State private var showingSheet = false
    
    @Binding var input: String
    @Binding var output: String
    
    var body: some View {
        HStack {
            Text("Language 1")
            .onTapGesture {
                showingSheet.toggle()
            }
            .sheet(isPresented: $showingSheet) {
                LanguageSelectView()
            }
            
            Spacer()
            
            Text("Translate")
            .onTapGesture {
                let options = TranslatorOptions(sourceLanguage: .english, targetLanguage: .german)
                let englishGermanTranslator = Translator.translator(options: options)

                let conditions = ModelDownloadConditions(
                    allowsCellularAccess: false,
                    allowsBackgroundDownloading: true
                )
                englishGermanTranslator.downloadModelIfNeeded(with: conditions) { error in guard error == nil else { return }
                }

                englishGermanTranslator.translate(input) { translatedText, error in guard error == nil, let translatedText = translatedText else { return }
                    output = translatedText
                }
            }
            
            Spacer()
            
            Text("Language 2")
            .onTapGesture {
                showingSheet.toggle()
            }
            .sheet(isPresented: $showingSheet) {
                LanguageSelectView()
            }
        }
    }
}

//struct LanguageSelectorView_Previews: PreviewProvider {
//    static var previews: some View {
//        LanguageSelectorView()
//    }
//}
