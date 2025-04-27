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

import Observation
import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    @State private var selectedItem: PostHeaderViewModel?

    var body: some View {
        NavigationStack {
            VStack(spacing: 8) {
                TopNavigationPanel(
                    title: .simpleText(text: AppInfo.name, contrast: .onLight),
                    leftViews: [],
                    rightViews: [
                        AnyView(
                            Button(action: {
                                // TODO:
                            }, label: {
                                PSIconHolder(icon: .like, scale: .large)
                            })
                            .foregroundStyle(.black)
                        ),
                        AnyView(
                            Button(action: {
                                // TODO:
                            }, label: {
                                PSIconHolder(icon: .chats, scale: .large)
                            })
                            .foregroundStyle(.black)
                        )
                    ]
                )
                .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
                List(viewModel.posts, id: \.id) { postItemViewModel in
                    PostHeaderView(viewModel: postItemViewModel) {
                        selectedItem = postItemViewModel
                    }
                    .listRowSeparator(.hidden)
                    .buttonStyle(PlainButtonStyle())
                }
                .listStyle(.plain)
                .padding(EdgeInsets(top: 0, leading: -28, bottom: -8, trailing: -28))
                .scrollIndicators(.hidden)
                PSSeparator()
            }
            .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
            .navigationDestination(item: $selectedItem) { postHeaderViewModel in
                PostDetailView(
                    viewModel: PostDetailViewModel(postHeaderViewModel: postHeaderViewModel)
                )
            }
        }
    }
}

#Preview {
    HomeView()
}
