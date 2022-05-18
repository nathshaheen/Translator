//
//  LanguageSelectorView.swift
//  Translator
//
//  Created by Nathan Shaheen on 25/4/2022.
//

import SwiftUI

struct LanguageSelectorView: View {
    @State private var showingSheet = false
    
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
                print("Translating...")
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

struct LanguageSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        LanguageSelectorView()
    }
}
