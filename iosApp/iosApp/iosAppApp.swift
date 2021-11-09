//
//  iosAppApp.swift
//  iosApp
//
//  Created by Frankie Murillo on 11/9/21.
//

import SwiftUI
import Firebase
@main
struct iosAppApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
