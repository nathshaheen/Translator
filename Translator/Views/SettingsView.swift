//
//  SettingsView.swift
//  Translator
//
//  Created by Nathan Shaheen on 29/4/2022.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: /*@PLACEHOLDER=Is On@*/.constant(true)) {
                    Text("Dark mode")
                }
                
                Text("Author: Nathan Shaheen")
                
                Text("Version: 0")
            }
            .navigationTitle("Settings")
            .padding()
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
