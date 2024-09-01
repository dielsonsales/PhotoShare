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

struct ReelsView: View {
    var body: some View {
        VStack {
            topNavigation
            HStack {
                Text("Ok")
            }
            .background(Color.red)
            Spacer()
            HStack {
                commentStack
                iconsStack
            }
        }
        .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
    }

    var topNavigation: some View {
        let buttons: [AnyView] = [
            AnyView(
                Button(action: {
                    // TODO:
                }, label: {
                    Image(systemName: "camera")
                        .imageScale(.large)
                })
                .foregroundStyle(.black)
            )
        ]
        return TopNavigationPanel(
            title: .simpleText(text: "Reels"),
            buttons: buttons
        )
    }

    var commentStack: some View {
        VStack(alignment: .leading) {
            Text("Correio braziliense")
            Text("Um caminhão que transportava gás ...")
            Text("🎵 correio.braziliense . original audio")
        }
        .background(Color.gray)
    }

    var iconsStack: some View {
        VStack(alignment: .center, spacing: 16) {
            Button(action: {
                // TODO:
            }, label: {
                Image(systemName: "heart")
                    .imageScale(.large)
                    .foregroundStyle(.black)
            })
            Text("123k")
                .font(.subheadline)
            Button(action: {
                // TODO:
            }, label: {
                Image(systemName: "message")
                    .imageScale(.large)
                    .foregroundStyle(.black)
            })
            Text("1.025")
                .font(.subheadline)
            Button(action: {
                // TODO:
            }, label: {
                Image(systemName: "paperplane")
                    .imageScale(.large)
                    .foregroundStyle(.black)
            })
            Text("82,4k")
                .font(.subheadline)
            Button(action: {
                // TODO:
            }, label: {
                Image(systemName: "ellipsis")
                    .imageScale(.large)
                    .foregroundStyle(.black)
            })
            Rectangle()
                .fill(Color.blue)
                .frame(width: 20, height: 20)
        }
        .frame(width: 40)
        .background(Color.yellow)
        .padding(EdgeInsets(top: 0, leading: 0, bottom: 8, trailing: 0))
    }
}

#Preview {
    ReelsView()
        .modelContainer(for: Item.self, inMemory: true)
}
