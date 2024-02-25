//
//  ProtoDeborahOgunniranApp.swift
//  ProtoDeborahOgunniran
//
//  Created by Ogunniran Deborah on 22/02/2024.
//

import SwiftUI
import Firebase

@main
struct ProtoDeborahOgunniranApp: App {
    @StateObject var viewModel = AuthModel()
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
