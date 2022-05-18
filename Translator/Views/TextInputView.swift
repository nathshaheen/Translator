//
//  TextInputView.swift
//  Translator
//
//  Created by Nathan Shaheen on 22/4/2022.
//

import SwiftUI

struct TextInputView: View {
    @Binding var inputText: String
    
    var body: some View {
        TextEditor(text: $inputText)
            .foregroundColor(.secondary)
            .padding()
    }
}

//struct TextInputView_Previews: PreviewProvider {
//    static var previews: some View {
//        TextInputView()
//    }
//}
