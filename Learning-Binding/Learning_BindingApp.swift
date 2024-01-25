//
//  Learning_BindingApp.swift
//  Learning-Binding
//
//  Created by Anand Narayan on 2024-01-18.
//

import SwiftUI

@main
struct Learning_BindingApp: App {
    
    @StateObject private var realmManager = RealmManager.shared
    
    var body: some Scene {
        WindowGroup {
            VStack {
                if let configuration = realmManager.configuration, let realm = realmManager.realm {
                    ContentView()
                        .environment(\.realmConfiguration, configuration)
                        .environment(\.realm, realm)
                }
                
            }.task {
                try? await realmManager.initialize()
            }
        }
    }
}
