//
//  LanguageSelectorView.swift
//  Translator
//
//  Created by Nathan Shaheen on 25/4/2022.
//

import SwiftUI

struct LanguageSelectorView: View {
    var body: some View {
        HStack {
            Text("Language 1")
            .onTapGesture {
                print("L1")
            }
            
            Spacer()
            
            Text("Translate")
            .onTapGesture {
                print("Trans")
            }
            
            Spacer()
            
            Text("Language 2")
            .onTapGesture {
                print("L2")
            }
        }
    }
}

struct LanguageSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        LanguageSelectorView()
    }
}
