//
//  ContentView.swift
//  UrbanServiceProject
//
//  Created by Aryan Panwar on 16/07/24.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0 
    @State private var showLogin = false
    var body: some View {
        TabView (selection : $selectedTab ){
            NavigationStack {
                AuthenticationView()
            }
            .tabItem {
                Label("Post" , systemImage: "person")
            }
            .tag(0)
            ServiceBrowsingView()
            .tabItem {
                Label("Browse" , systemImage: "list.bullet")
            }
            .tag(1)
            
            NavigationStack {
                ServicePostingView()
            }
            .tabItem {
                Label("Post" , systemImage: "plus.circle")
            }
            .tag(2)
            
            NavigationStack{
                MyServicesScreen()
            }
            .tabItem {
                Label("My Services" , systemImage: "person.circle")
            }
            .tag(3)
            
        }
    }
}

#Preview {
    ContentView()
}
