//
//  TextOutputView.swift
//  Translator
//
//  Created by Nathan Shaheen on 22/4/2022.
//

import SwiftUI

struct TextOutputView: View {
    @Binding var outputText: String
    var body: some View {
        Text(outputText)
            .foregroundColor(.secondary)
            .padding()
    }
}

//struct TextOutputView_Previews: PreviewProvider {
//    static var previews: some View {
//        TextOutputView()
//    }
//}
