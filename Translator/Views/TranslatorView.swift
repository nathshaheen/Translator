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
            Text("Translator tab")
                .navigationTitle("Translator")
        }
    }
}

struct TranslatorView_Previews: PreviewProvider {
    static var previews: some View {
        TranslatorView()
    }
}
