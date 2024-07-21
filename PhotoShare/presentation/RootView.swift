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
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                }
            SearchView()
                .tabItem {
                    Image(systemName: "text.magnifyingglass.rtl")
                }
            AddContentView()
                .tabItem {
                    Image(systemName: "plus.app.fill")
                }
            StoriesView()
                .tabItem {
                    Image(systemName: "movieclapper")
                }
            AccountView()
                .tabItem {
                    Image(systemName: "person.crop.circle")
                }
        }
    }
}

struct SearchView: View {
    var body: some View {
        Text("SearchView")
    }
}

struct AddContentView: View {
    var body: some View {
        Text("AddContentView")
    }
}

struct StoriesView: View {
    var body: some View {
        Text("StoriesView")
    }
}

struct AccountView: View {
    var body: some View {
        Text("AccountView")
    }
}
