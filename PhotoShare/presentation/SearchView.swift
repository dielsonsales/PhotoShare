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

struct SearchItem: Codable, Hashable, Identifiable {
    let id: String
    let description: String

    init(description: String) {
        id = UUID().uuidString
        self.description = description
    }
}

final class SearchItemViewModel: ObservableObject {
    @Published var searchItems = [SearchItem]()
    @Published var searchText = ""

    var filteredItems: [SearchItem] {
        if searchText.isEmpty {
            return searchItems
        } else {
            return searchItems.filter { item in
                item.description.lowercased().contains(searchText.lowercased())
            }
        }
    }

    init() {
        var i = 0
        while i < 20 {
            searchItems.append(SearchItem(description: "Test \(i)"))
            i += 1
        }
    }
}

struct SearchView: View {
    @StateObject var viewModel = SearchItemViewModel()

    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.filteredItems, id: \.self) { searchItem in
                    Text(searchItem.description)
                }
            }
            .listStyle(.plain)
            .searchable(text: $viewModel.searchText)
            .navigationTitle("Test")
        }
    }
}

#Preview {
    SearchView()
        .modelContainer(for: Item.self, inMemory: true)
}
