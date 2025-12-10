//
//  tickethamsterV3App.swift
//  tickethamsterV3
//
//  Created by Eduardo Wolffel on 17/10/24.
//

import SwiftUI
import FirebaseCore   // importante: este es el módulo de inicialización

@main
struct tickethamsterV3App: App {
    
    // inicializador de la App
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
