//
//  MovieDatabaseApp.swift
//  MovieDatabase
//
//  Created by Belli's MacBook on 12/11/2022.
//

import SwiftUI

@main
struct MovieDatabaseApp: App {
    @StateObject private var vm_homeView = VM_HomeView()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
                    .environmentObject(vm_homeView)
            }
            .navigationBarHidden(true)
        }
    }
}
