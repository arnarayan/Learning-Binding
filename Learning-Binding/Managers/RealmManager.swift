//
//  RealmManagers.swift
//  Learning-Binding
//
//  Created by Anand Narayan on 2024-01-20.
//

import Foundation
import RealmSwift

class RealmManager: ObservableObject {
    let app: App
    
    
    @Published var realm: Realm?
    static let shared = RealmManager()
    @Published var user: User?
    @Published var configuration: Realm.Configuration?
    
    private init() {
        self.app = App(id: "application-0-yaaqx")
    }
    
    @MainActor //Gets activted on the main thread? wha?
    func initialize() async throws {
        
        
        //Authentication
        user = try await app.login(credentials: Credentials.anonymous)
        self.configuration = user?.flexibleSyncConfiguration(initialSubscriptions: { subs in
            if ((subs.first(named: "all-tasks")) == nil) {
                subs.append(QuerySubscription<Task>(name: "all-tasks"))
            }
            
            if ((subs.first(named: "all-notes")) == nil) {
                subs.append(QuerySubscription<Note>(name: "all-notes"))
            }
        }, rerunOnOpen: true)
        
        realm = try! await Realm(configuration: configuration!, downloadBeforeOpen: .always)
    }
}
