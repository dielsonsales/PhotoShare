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

struct PostDetailView: View {
    @StateObject var viewModel: PostDetailViewModel

    var body: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: false) {
                PostItemView(viewModel: viewModel.postItem)
                LazyVStack(alignment: .leading, spacing: 0) {
                    ForEach(viewModel.comments, id: \.id) { commentViewModel in
                        CommentItem(viewModel: commentViewModel)
                    }
                }
            }
            .scrollDismissesKeyboard(.immediately)
            .onTapGesture {
                dismissKeyboard()
            }
            PSSeparator()
            HStack {
                TextField("Escreva um comentário...", text: $viewModel.inputText)
                    .padding()
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(20)
                Button(action: {
                    // TODO:
                }, label: {
                    Image(systemName: "paperplane.circle.fill")
                        .imageScale(.large)
                })
            }
            .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
        }
    }
}

#Preview {
    PostDetailView(
        viewModel: PostDetailViewModel.mock
    )
}
