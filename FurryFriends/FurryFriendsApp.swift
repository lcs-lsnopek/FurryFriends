//
//  FurryFriendsApp.swift
//  FurryFriends
//
//  Created by Russell Gordon on 2022-02-26.
//

import SwiftUI

@main
struct FurryFriendsApp: App {
    var body: some Scene {
        WindowGroup {
            
            
            TabView {
                ContentView()
                    .tabItem {
                        Image(systemName: "divide.circle")
                       Text("Dogs")
                    }

                CatView()
                   .tabItem {
                       Image(systemName: "divide.circle")
                        Text("Cats")
                    }
            }
            
//            NavigationView {
//                ContentView()
//            }
        }
    }
}
