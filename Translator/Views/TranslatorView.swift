//
//  TranslatorView.swift
//  Translator
//
//  Created by Nathan Shaheen on 29/4/2022.
//

import SwiftUI

struct TranslatorView: View {
    var body: some View {
        NavigationView {
            VStack {
                List {
                    Section {
                        TextInputView()
                        TextOutputView()
                    }
                                                            
                    Section {
                        LanguageSelectorView()
                    }
                }
                .listStyle(InsetGroupedListStyle())
            }
            .navigationTitle("Translator")
        }
    }
}

struct TranslatorView_Previews: PreviewProvider {
    static var previews: some View {
        TranslatorView()
    }
}
