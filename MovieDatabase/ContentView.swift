//
//  ContentView.swift
//  MovieDatabase
//
//  Created by Belli's MacBook on 12/11/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var vm_homeView = VM_HomeView()
    var body: some View {
        NavigationView {
            HomeView()
                .environmentObject(vm_homeView)
        }
        .navigationBarHidden(true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView()
                .environmentObject(VM_HomeView())
        }
    }
}
