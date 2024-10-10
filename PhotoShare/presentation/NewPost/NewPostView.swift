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

struct NewPostView: View {

    @Binding var presentScreen: Bool

    var body: some View {
        GeometryReader { reader in
            let imageSize = reader.size.width - 16 * 2
            VStack {
                topBar
                photoView
                    .frame(
                        width: imageSize,
                        height: imageSize * 0.8
                    )
                managePhotosView
                Spacer()
            }
            .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
            .background(Color.black)
        }
    }

    var topBar: some View {
        let leftButtons: [AnyView] = [
            AnyView(
                Button(action: {
                    // TODO: later
                }, label: {
                    Button(action: {
                        presentScreen = false
                    }, label: {
                        Image(systemName: "xmark")
                            .imageScale(.large)
                    })
                    .foregroundStyle(.white)
                })
            )
        ]
        let rightButtons: [AnyView] = [
            AnyView(
                Button(action: {
                    // TODO: later
                }, label: {
                    Text("Next")
                        .bold()
                })
            )
        ]
        return TopNavigationPanel(
            title: .simpleText(text: "New Post", contrast: .onDark),
            leftViews: leftButtons,
            rightViews: rightButtons
        )
    }

    var photoView: some View {
        Rectangle()
            .fill(Color.blue)
    }

    var managePhotosView: some View {
        VStack {
            HStack {
                Text("You've given PhotoShare access to a select number of photos and videos.")
                    .lineLimit(2)
                    .font(.subheadline)
                    .foregroundStyle(.gray)
                Spacer()
                Button(action: {
                    // TODO: later
                }, label: {
                    Text("Manage")
                        .bold()
                        .foregroundStyle(.white)
                })
            }
            .padding(
                EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8)
            )
            .frame(height: 70)
            .background(
                Color(red: 0.15, green: 0.15, blue: 0.15)
            )
        }
    }
}

#Preview {
    NewPostView(presentScreen: .constant(true))
        .modelContainer(for: Item.self, inMemory: true)
}
