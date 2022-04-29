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
            Text("Settings tab")
                .navigationTitle("Settings")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
