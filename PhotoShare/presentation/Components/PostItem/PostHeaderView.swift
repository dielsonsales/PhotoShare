//  PhotoShare
//  Copyright (C) 2025  Dielson Sales de Carvalho.
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

struct PostHeaderView: View {
    @ObservedObject var viewModel: PostHeaderViewModel
    var onTap: (() -> Void)? = nil

    var body: some View {
        VStack {
            HStack {
                PSImageView()
                    .frame(width: 30, height: 30)
                    .cornerRadius(15)
                    .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 0))
                VStack(alignment: .leading) {
                    Text(viewModel.userDisplayName)
                        .font(.caption)
                    Text(viewModel.username)
                        .font(.caption)
                }
                Spacer()
                PSIconHolder(icon: .seeMore)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 8))
            }
            .frame(maxWidth: .infinity)
            .padding(EdgeInsets(top: 8, leading: 0, bottom: 0, trailing: 0))
            ZStack {
                PSImageView()
            }
            .frame(minWidth: nil, maxWidth: .infinity, minHeight: 400, maxHeight: 400)
            HStack(spacing: 10) {
                Button(action: {
                    // TODO:
                    print("Tapping on like")
                }, label: {
                    HStack(spacing: 2) {
                        PSIconHolder(icon: .like, scale: .large)
                            .foregroundStyle(.black)
                        Text(String(54))
                            .foregroundStyle(.black)
                    }
                })
                Button(action: {
                    // TODO:
                    print("Tapping on comments")
                }, label: {
                    HStack(spacing: 2) {
                        PSIconHolder(icon: .comments, scale: .large)
                            .foregroundStyle(.black)
                        Text(String(viewModel.commentsCount))
                            .foregroundStyle(.black)
                    }
                })
                Button(action: {
                    // TODO:
                    print("Tapping on share")
                }, label: {
                    HStack(spacing: 2) {
                        PSIconHolder(icon: .share, scale: .large)
                            .foregroundStyle(.black)
                        Text(String(viewModel.sharesCount))
                            .foregroundStyle(.black)
                    }
                })
                Spacer()
                Button(action: {
                    // TODO:
                    print("Tapping on favorite")
                }, label: {
                    PSIconHolder(icon: .favorite, scale: .large)
                        .foregroundStyle(.black)
                })
            }
            .padding(EdgeInsets(top: 1, leading: 8, bottom: 8, trailing: 8))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
        .onTapGesture {
            onTap?()
        }
    }
}
