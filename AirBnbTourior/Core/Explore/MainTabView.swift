//
//  MainTabView.swift
//  AirBnbTourior
//
//  Created by 王佩豪 on 2024/4/7.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView{
            ExploreView()
                .tabItem { Label("Explore", systemImage: "magnifyingglass") }
            
            WishListView()
                .tabItem { Label("Wishlist", systemImage: "heart") }
            
            ProfileView()
                .tabItem { Label("Profile", systemImage: "person") }
        }
    }
}

#Preview {
    MainTabView()
}
