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

struct ProfileView: View {
    var body: some View {
        ScrollView {
            VStack {
                topBar
                HStack(alignment: .center, spacing: 16) {
                    VStack(alignment: .center, spacing: 8) {
                        Rectangle()
                            .fill(Color.blue)
                            .frame(width: 60, height: 60)
                            .cornerRadius(30)
                        Text("Dielson Sales")
                            .font(.callout)
                    }
                    Spacer()
                    VStack(alignment: .center, spacing: 8) {
                        Text("21")
                        Text("posts")
                            .font(.subheadline)
                            .lineLimit(1)
                    }
                    Spacer()
                    VStack(alignment: .center, spacing: 8) {
                        Text("75")
                        Text("followers")
                            .font(.subheadline)
                            .lineLimit(1)
                    }
                    Spacer()
                    VStack(alignment: .center, spacing: 8) {
                        Text("146")
                        Text("following")
                            .font(.subheadline)
                            .lineLimit(1)
                    }
                }
                .frame(height: 110, alignment: .center)
                HStack(alignment: .center) {
                    Text("Learning to survive anxiety")
                        .font(.callout)
                    Spacer()
                }
                .frame(height: 40)
                profileButtons
                PagerView(items: [
                    "squareshape.split.3x3",
                    "video.bubble",
                    "tag"
                ])
                .frame(height: 700)
            }
        }
        .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
        .scrollIndicators(.hidden)
    }

    var topBar: some View {
        let leftView = AnyView(
            HStack(spacing: 8) {
                Image(systemName: "lock")
                Text("d.scar.valho")
                    .font(.title2)
            }
        )
        let buttons: [AnyView] = [
            AnyView(
                Button(action: {
                    // TODO:
                }, label: {
                    Image(systemName: "plus.app")
                        .imageScale(.large)
                })
                .foregroundStyle(.black)
            ),
            AnyView(
                Button(action: {
                    // TODO:
                }, label: {
                    Image(systemName: "line.3.horizontal")
                        .imageScale(.large)
                })
                .foregroundStyle(.black)
            )
        ]
        return TopNavigationPanel(leftView: leftView, buttons: buttons)
    }

    var profileButtons: some View {
        HStack(alignment: .center, spacing: 8) {
            Button("Edit Profile") { }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color(UIColor.secondarySystemBackground))
                .foregroundStyle(.black)
                .cornerRadius(8)
                .padding(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
            Button("Share Profile") { }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color(UIColor.secondarySystemBackground))
                .foregroundStyle(.black)
                .cornerRadius(8)
                .padding(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
            Button(action: {
                // TODO:
            }, label: {
                Image(systemName: "person.badge.plus")
                    .imageScale(.medium)
                    .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))

            })
            .frame(maxHeight: .infinity)
            .background(Color(UIColor.secondarySystemBackground))
            .foregroundStyle(.black)
            .cornerRadius(8)
            .padding(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))

        }
        .frame(height: 54)
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    ProfileView()
        .modelContainer(for: Item.self, inMemory: true)
}
