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
        
        let store = Store_(reducer: reducer)
        
        WindowGroup {
            VStack {
                if let configuration = realmManager.configuration, let realm = realmManager.realm {
                    ContentView()
                        .environment(\.realmConfiguration, configuration)
                        .environment(\.realm, realm)
                        .environmentObject(store)
                }
                
            }.task {
                try? await realmManager.initialize()
            }
        }
    }
}
