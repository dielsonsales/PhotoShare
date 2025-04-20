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

struct PhotosGridView: View {
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        GeometryReader { reader in
            let width: CGFloat = reader.size.width >= 0 ? (reader.size.width - 5 * 20) / 4 : 0
            let consideredWidth = width >= 0 ? width : 0
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(0..<4) { _ in
                        Rectangle()
                            .fill(Color.blue)
                            .frame(width: consideredWidth, height: consideredWidth)
                        Rectangle()
                            .fill(Color.blue)
                            .frame(width: consideredWidth, height: consideredWidth)
                        Rectangle()
                            .fill(Color.blue)
                            .frame(width: consideredWidth, height: consideredWidth)
                        Rectangle()
                            .fill(Color.blue)
                            .frame(width: consideredWidth, height: consideredWidth)
                    }
                }
            }
            .padding()
        }
    }
}
