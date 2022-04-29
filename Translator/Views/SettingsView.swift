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
            VStack {
                Toggle(isOn: /*@PLACEHOLDER=Is On@*/.constant(true)) {
                    Text("Dark mode")
                }
                .padding()
                .background(Color.secondary)
                .cornerRadius(10)
                
                Text("Author: Nathan Shaheen")
                    .padding()
                Text("Version: 0")
                
                Spacer()
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
