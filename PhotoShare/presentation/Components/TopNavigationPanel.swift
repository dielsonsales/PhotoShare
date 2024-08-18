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

    enum TitleType {
        case simpleText(text: String)
        case customView(view: AnyView)
    }

    let title: TitleType
    let buttons: [AnyView]

    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            switch title {
            case .simpleText(let text):
                Text(text)
                    .font(.title2)
            case .customView(let view):
                view
            }
            Spacer()
            ForEach(0..<buttons.count, id: \.self) { index in
                buttons[index]
            }
        }
        .frame(height: 40, alignment: .center)
    }
}
