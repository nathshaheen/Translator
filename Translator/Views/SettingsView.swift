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
                Section {
                    Toggle(isOn: /*@PLACEHOLDER=Is On@*/.constant(true)) {
                        Text("Dark mode")
                    }
                } footer: {
                    VStack() {
                        Spacer()
                        HStack {
                            Spacer()
                            VStack(spacing: 15) {
                                Text("Author: Nathan Shaheen")
                                Text("Version: 0")
                            }
                            Spacer()
                        }
                    }
                }
            }
            .navigationTitle("Settings")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
