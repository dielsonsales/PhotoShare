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
    let imageURL: String
    let description: String

    init(description: String) {
        id = UUID().uuidString
        self.imageURL = ""
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
        GeometryReader { geometry in
            let gridSize = geometry.size.width / 2 - 10
            let gridColumns = [
                GridItem(.fixed(gridSize), spacing: 5, alignment: .leading),
                GridItem(.fixed(gridSize), spacing: 5, alignment: .leading)
            ]
            VStack {
                HStack(alignment: .center) {
                    Image(systemName: "magnifyingglass")
                    TextField("Search", text: $viewModel.searchText)
                }
                .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                .background(Color(UIColor.secondarySystemBackground))
                .overlay(RoundedRectangle(cornerRadius: 5).stroke(.gray, lineWidth: 0.5))
                .padding(EdgeInsets(top: 2, leading: 8, bottom: 2, trailing: 8))
                ScrollView {
                    LazyVGrid(columns: gridColumns, spacing: 5) {
                        ForEach(0..<9) { item in
                            Rectangle()
                                .fill(Color.blue)
                                .frame(height: gridSize, alignment: .top)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    SearchView()
        .modelContainer(for: Item.self, inMemory: true)
}
