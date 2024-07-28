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

struct PagerView: View {
    @State private var selectedIndex = 0
    let icons: [String]

    var body: some View {
        GeometryReader { geometry in
            let gridSize = (geometry.size.width - 4 * 8) / 3
            VStack {
                // Tab bar
                let padding = gridSize / 2
                HStack {
                    ForEach(0..<icons.count, id: \.self) { index in
                        Button(action: {
                            selectedIndex = index
                        }, label: {
                            Image(systemName: icons[index])
                                .imageScale(.large)
                                .padding(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
                            if index < icons.count - 1 {
                                Spacer()
                            }
                        })
                        .foregroundStyle(selectedIndex == index ? Color.black : Color.gray)
                    }
                }
                .padding(EdgeInsets(top: 0, leading: padding, bottom: 0, trailing: padding))
                // Content view
                TabView(selection: $selectedIndex) {
                    ForEach(0..<icons.count, id: \.self) { index in
                        Rectangle()
                            .fill(index == 0 ? Color.blue: Color.yellow)
                            .tag(index)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            }
        }
    }
}

#Preview {
    ZStack {
        let icons: [String] = [
            "squareshape.split.3x3",
            "video.bubble",
            "tag"
        ]
        PagerView(icons: icons)
            .modelContainer(for: Item.self, inMemory: true)
    }
}
