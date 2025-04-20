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

struct TopNavigationPanel: View {
    enum TitleContrast {
        case onDark
        case onLight
    }

    enum TitleType {
        case simpleText(text: String, contrast: TitleContrast)
        case customView(view: AnyView)
    }

    let title: TitleType
    let leftViews: [AnyView]
    let rightViews: [AnyView]

    var body: some View {
        ZStack {
            HStack(alignment: .center, spacing: 16) {
                Spacer()
                switch title {
                case .simpleText(let text, let contrast):
                    Text(text)
                        .font(.title2)
                        .foregroundStyle(contrast == .onDark ? Color.white : Color.black)
                case .customView(let view):
                    view
                }
                Spacer()
            }
            HStack(alignment: .center, spacing: 16) {
                ForEach(0..<leftViews.count, id: \.self) { index in
                    leftViews[index]
                }
                Spacer()
                ForEach(0..<rightViews.count, id: \.self) { index in
                    rightViews[index]
                }
            }
        }
        .frame(height: 40, alignment: .center)
    }
}
