//  PhotoShare
//  Copyright (C) 2024  Dielson Sales de Carvalho.
//
//  This program is free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//
//  You should have received a copy of the GNU General Public License
//  along with this program.  If not, see https://www.gnu.org/licenses/.

import SwiftUI

struct RootView: View {
    @State private var presentNewPostScreen = false
    @State private var selectedTab = 0
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView()
                .tabItem {
                    PSIconHolder(icon: .home)
                }
                .tag(0)
            SearchView()
                .tabItem {
                    PSIconHolder(icon: .search)
                }
                .tag(1)
            Text("New Post")
                .tabItem {
                    PSIconHolder(icon: .addNew)
                }
                .onTapGesture {
                    presentNewPostScreen = true
                }
                .tag(2)
            .tabItem {
                PSIconHolder(icon: .addNew)
            }
            ReelsView()
                .tabItem {
                    PSIconHolder(icon: .reels)
                }
                .tag(3)
            ProfileView()
                .tabItem {
                    PSIconHolder(icon: .profile)
                }
                .tag(4)
        }
        .onChange(of: selectedTab) { previousTab, newTab in
            if newTab == 2 {
                presentNewPostScreen = true
                selectedTab = previousTab
            }
        }
        .fullScreenCover(isPresented: $presentNewPostScreen, content: {
            NewPostView(presentScreen: $presentNewPostScreen)
        })
    }
}
