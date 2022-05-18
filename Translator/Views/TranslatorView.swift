//
//  TranslatorView.swift
//  Translator
//
//  Created by Nathan Shaheen on 29/4/2022.
//

import SwiftUI

struct TranslatorView: View {
    @State var input = "Enter text"
    @State var output = ""
    var body: some View {
        NavigationView {
            VStack {
                List {
                    Section {
                        TextInputView(inputText: $input)
                        TextOutputView(outputText: $output)
                    }
                                                            
                    Section {
                        LanguageSelectorView(input: $input, output: $output)
                    }
                }
                .listStyle(InsetGroupedListStyle())
            }
            .navigationTitle("Translator")
        }
    }
}

//struct TranslatorView_Previews: PreviewProvider {
//    static var previews: some View {
//        TranslatorView()
//    }
//}
