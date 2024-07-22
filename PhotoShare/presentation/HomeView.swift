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

struct HomeView: View {
    var body: some View {
        VStack {
            ScrollView {
                PostItem()
                PostItem()
                PostItem()
            }
            .padding(EdgeInsets(top: -8, leading: 0, bottom: -8, trailing: 0))
            Rectangle()
                .frame(height: 0.5)
                .foregroundStyle(Color(UIColor.secondaryLabel))
        }
    }
}

struct PostItem: View {
    var body: some View {
        VStack {
            HStack {
                Rectangle()
                    .fill(Color.blue)
                    .background(Color.blue)
                    .frame(width: 30, height: 30)
                    .cornerRadius(10)
                    .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 0))
                VStack(alignment: .leading) {
                    Text("retrocomputers")
                        .font(.caption)
                    Text("retrocomputers_")
                        .font(.caption)
                }
                Spacer()
                Image(systemName: "ellipsis")
            }
            .frame(maxWidth: .infinity)
            .padding(EdgeInsets(top: 8, leading: 8, bottom: 0, trailing: 8))
            ZStack {
                Rectangle()
                    .fill(Color.blue)
            }
            .frame(minWidth: nil, maxWidth: .infinity, minHeight: 400, maxHeight: 400)
            HStack {
                Button(action: {
                    // TODO:
                }, label: {
                    Image(systemName: "heart")
                        .imageScale(.large)
                        .foregroundStyle(.black)
                })
                Button(action: {
                    // TODO:
                }, label: {
                    Image(systemName: "message")
                        .imageScale(.large)
                        .foregroundStyle(.black)
                })
                Button(action: {
                    // TODO:
                }, label: {
                    Image(systemName: "paperplane")
                        .imageScale(.large)
                        .foregroundStyle(.black)
                })
                Spacer()
                Button(action: {
                    // TODO:
                }, label: {
                    Image(systemName: "star")
                        .imageScale(.large)
                        .foregroundStyle(.black)
                })
            }
            .padding(EdgeInsets(top: 1, leading: 8, bottom: 8, trailing: 8))
        }
        .background(Color.red)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
    }
}

#Preview {
    HomeView()
        .modelContainer(for: Item.self, inMemory: true)
}
