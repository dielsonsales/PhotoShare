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
            ZStack {
                Rectangle()
                    .fill(Color.gray)
                    .padding(
                        EdgeInsets(
                            top: 0,
                            leading: -16,
                            bottom: -16,
                            trailing: -16
                        )
                    )
                HStack {
                    VStack {
                        Spacer()
                        commentStack
                    }
                    VStack {
                        Spacer()
                        iconsStack
                    }

                }
            }
        }
        .padding(
            EdgeInsets(
                top: 0,
                leading: 16,
                bottom: 16,
                trailing: 16
            )
        )
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
        VStack(alignment: .leading, spacing: 8) {
            HStack(alignment: .center, spacing: 8) {
                Rectangle()
                    .fill(Color.yellow)
                    .cornerRadius(30)
                    .frame(width: 30, height: 30)
                Text("Correio braziliense")
                    .bold()
                Button(action: {
                    // TODO
                }) {
                    Text("follow")
                        .padding(
                            EdgeInsets(
                                top: 4,
                                leading: 4,
                                bottom: 4,
                                trailing: 4
                            )
                        )
                        .foregroundColor(.black)

                }
                .padding([.all], 1.0 / 2.0)
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.black, lineWidth: 1.0)
                )

            }

            Text("Um caminhão que transportava gás ...")
            Text("🎵 correio.braziliense . original audio")
        }
//        .background(Color.gray)
    }

    var iconsStack: some View {
        VStack(alignment: .center, spacing: 16) {
            VStack(spacing: 5) {
                Button(action: {
                    // TODO:
                }, label: {
                    Image(systemName: "heart")
                        .imageScale(.large)
                        .foregroundStyle(.black)
                })
                Button(action: {
                    // TODO:
                }) {
                    Text("123k")
                        .font(.subheadline)
                        .foregroundStyle(Color.black)
                }
            }
            Button(action: {
                // TODO:
            }) {
                VStack(spacing: 5) {
                    Image(systemName: "message")
                        .imageScale(.large)
                        .foregroundStyle(.black)
                    Text("1.025")
                        .font(.subheadline)
                        .foregroundStyle(Color.black)
                }
            }
            Button(action: {
                // TODO:
            }) {
                VStack(spacing: 5) {
                    Image(systemName: "paperplane")
                        .imageScale(.large)
                        .foregroundStyle(.black)
                    Text("82,4k")
                        .font(.subheadline)
                        .foregroundStyle(.black)
                }
            }
            Button(action: {
                // TODO:
            }, label: {
                Image(systemName: "ellipsis")
                    .imageScale(.large)
                    .foregroundStyle(.black)
            })
            .frame(height: 40)
        }
        .frame(width: 40)

        .padding(
            EdgeInsets(
                top: 8,
                leading: 0,
                bottom: 8,
                trailing: 0
            )
        )
        .background(Color.yellow)
    }
}

#Preview {
    ReelsView()
        .modelContainer(for: Item.self, inMemory: true)
}
