//
//  ContentView.swift
//  Translator
//
//  Created by Nathan Shaheen on 22/4/2022.
//

import SwiftUI

struct ContentView: View {
    static let screenHeight = UIScreen.main.bounds.height
    
    var body: some View {
        TabView {
            TextTranslationView()
                .tabItem {
                    Label("Text", systemImage: "character.cursor.ibeam")
                }
            
            ImageTranslationView()
                .tabItem {
                    Label("Image", systemImage: "photo")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
