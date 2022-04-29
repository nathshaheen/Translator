//
//  ContentView.swift
//  Translator
//
//  Created by Nathan Shaheen on 22/4/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            TranslatorView()
                .tabItem {
                    Label("Translator", systemImage: "globe")
                }
            
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
