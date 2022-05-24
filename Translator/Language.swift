//
//  Language.swift
//  Translator
//
//  Created by Nathan Shaheen on 24/5/2022.
//

import Foundation

import MLKit

struct Language: Hashable {
    var id: Int
    var name: String
    var languageIdentifier: TranslateLanguage
}
