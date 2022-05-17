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
            Spacer()
            
            Button(action: {}, label: {Text("Language 1")}).onTapGesture {
                print("L1")
            }
            
            Button(action: {}, label: {Text("Translate")}).onTapGesture {
                print("Trans")
            }
            
            Button(action: {}, label: {Text("Language 2")}).onTapGesture {
                print("L2")
            }
            
            Spacer()
        }
    }
}

struct LanguageSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        LanguageSelectorView()
    }
}
