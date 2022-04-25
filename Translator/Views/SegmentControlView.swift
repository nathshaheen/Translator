//
//  SegmentControlView.swift
//  Translator
//
//  Created by Nathan Shaheen on 22/4/2022.
//

import SwiftUI

struct SegmentControlView: View {
    @State private var currentTranslationView = "character.cursor.ibeam"
    var translationViews = ["character.cursor.ibeam", "photo", "waveform"]
    
    var body: some View {
        VStack {
            Picker("", selection: $currentTranslationView) {
                ForEach(translationViews, id: \.self) {
                    Image(systemName: $0)
                }
            }
            .pickerStyle(.segmented)
            .padding()
            
            Text("Value: \(currentTranslationView)") // Debug
        }
    }
}

struct SegmentControlView_Previews: PreviewProvider {
    static var previews: some View {
        SegmentControlView()
    }
}
