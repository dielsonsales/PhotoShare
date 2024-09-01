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
                    .fill(Color.brown)
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
                Button(action: {
                    // TODO
                }, label: {
                    Rectangle()
                        .fill(Color.yellow)
                        .cornerRadius(30)
                        .frame(width: 30, height: 30)
                })
                Button(action: {
                    // TODO
                }, label: {
                    Text("correio.braziliense")
                        .bold()
                        .foregroundStyle(Color.white)
                })
                Button(action: {
                    // TODO
                }, label: {
                    Text("follow")
                        .padding(
                            EdgeInsets(
                                top: 4,
                                leading: 4,
                                bottom: 4,
                                trailing: 4
                            )
                        )

                })
                .padding([.all], 1.0 / 2.0)
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.white, lineWidth: 1.0)
                )
                .foregroundStyle(Color.white)

            }
            Text("Um caminhão que transportava gás na rodovia explodiu")
                .lineLimit(1)
                .foregroundStyle(Color.white)
            ScrollView(.horizontal) {
                VStack(spacing: 8) {
                    Button(action: {
                        // TODO:
                    }, label: {
                        Text("🎵 correio.braziliense . original audio")
                            .font(.subheadline)
                    })
                    .background(Color.gray)
                    .foregroundStyle(.white)
                    .cornerRadius(8)
                    .padding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8))
                }
            }
        }
    }

    var iconsStack: some View {
        VStack(alignment: .center, spacing: 16) {
            VStack(spacing: 5) {
                Button(action: {
                    // TODO:
                }, label: {
                    Image(systemName: "heart")
                        .imageScale(.large)
                })
                Button(action: {
                    // TODO:
                }, label: {
                    Text("123k")
                        .font(.subheadline)
                })
            }
            Button(action: {
                // TODO:
            }, label: {
                VStack(spacing: 5) {
                    Image(systemName: "message")
                        .imageScale(.large)
                    Text("1.025")
                        .font(.subheadline)
                }
            })
            Button(action: {
                // TODO:
            }, label: {
                VStack(spacing: 5) {
                    Image(systemName: "paperplane")
                        .imageScale(.large)
                    Text("82,4k")
                        .font(.subheadline)
                }
            })
            Button(action: {
                // TODO:
            }, label: {
                Image(systemName: "ellipsis")
                    .imageScale(.large)
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
        .foregroundStyle(Color.white)
    }
}

#Preview {
    ReelsView()
        .modelContainer(for: Item.self, inMemory: true)
}
