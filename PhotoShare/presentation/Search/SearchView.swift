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

struct SearchItemDefaultCell: View {
    let itemSize: CGFloat
    init(itemSize: CGFloat) {
        self.itemSize = itemSize
    }
    var body: some View {
        HStack(alignment: .top, spacing: 8) {
            PSImageView()
                .frame(width: itemSize, height: itemSize)
            PSImageView()
                .frame(width: itemSize, height: itemSize)
        }
    }
}

struct SearchItemDoubleCell: View {
    let itemSize: CGFloat
    init(itemSize: CGFloat) {
        self.itemSize = itemSize
    }
    var body: some View {
        HStack(alignment: .top, spacing: 8) {
            VStack(spacing: 8) {
                PSImageView()
                    .frame(width: itemSize, height: itemSize)
                PSImageView()
                    .frame(width: itemSize, height: itemSize)
            }
            PSImageView()
                .frame(width: itemSize, height: itemSize * 2 + 8)
        }
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
        var index = 0
        while index < 20 {
            searchItems.append(SearchItem(description: "Test \(index)"))
            index += 1
        }
    }
}

struct SearchView: View {
    @StateObject var viewModel = SearchItemViewModel()

    var body: some View {
        GeometryReader { geometry in
            let gridSize = (geometry.size.width - 4 * 8) / 3
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
                    SearchLayout {
                        ForEach(0..<9) { item in
                            if item % 3 == 0 {
                                PSImageView()
                                    .frame(width: gridSize, height: gridSize * 2 + 8)
                            } else {
                                PSImageView()
                                    .frame(width: gridSize, height: gridSize)
                            }
                        }
                    }
                    .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
                }
            }
        }
    }
}

#Preview {
    SearchView()
        .modelContainer(for: Item.self, inMemory: true)
}
