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

class PostDetailViewModel: ObservableObject {
    @ObservedObject var postHeaderViewModel: PostHeaderViewModel
    @Published var inputText: String = ""
    @Published var comments: [CommentItemViewModel]

    init(postHeaderViewModel: PostHeaderViewModel, comments: [CommentItemViewModel]? = nil) {
        self.postHeaderViewModel = postHeaderViewModel
        if let comments {
            self.comments = comments
        } else {
            var postComment: PostComment = PostComment()
            postComment.text = "Que legal!"
            self.comments = [
                CommentItemViewModel(comment: postComment),
                CommentItemViewModel(comment: postComment),
                CommentItemViewModel(comment: postComment),
                CommentItemViewModel(comment: postComment),
                CommentItemViewModel(comment: postComment),
                CommentItemViewModel(comment: postComment)
            ]
        }
    }
}
