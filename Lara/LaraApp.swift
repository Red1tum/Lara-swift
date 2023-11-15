//
//  LaraApp.swift
//  Lara
//
//  Created by Reditum on 11/12/23.
//

import SwiftUI

@main
struct LaraApp: App {
    init() {
        let names = UIFont.familyNames
        for name in names {
            print("------------------")
            print(name)
            let names = UIFont.fontNames(forFamilyName: name)
            print(names)
        }
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
