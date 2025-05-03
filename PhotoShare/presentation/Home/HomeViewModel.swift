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

import Foundation

class HomeViewModel: ObservableObject {
    @Published var posts = [PostHeaderViewModel]()
    @Published var isLoading = true

    private var loadTask: Task<Void, Never>?

    init() {
        posts = [
            PostHeaderViewModel(
                userDisplayName: "retrocomputers",
                username: "retrocomputers_",
                userImageURL: "",
                imageURL: "",
                description: "This is an image description",
                likesCount: 54,
                commentsCount: 5,
                sharesCount: 8,
                isFavorite: false
            ),
            PostHeaderViewModel(
                userDisplayName: "retrocomputers",
                username: "retrocomputers_",
                userImageURL: "",
                imageURL: "",
                description: "This is an image description",
                likesCount: 54,
                commentsCount: 5,
                sharesCount: 8,
                isFavorite: false
            ),
            PostHeaderViewModel(
                userDisplayName: "retrocomputers",
                username: "retrocomputers_",
                userImageURL: "",
                imageURL: "",
                description: "This is an image description",
                likesCount: 54,
                commentsCount: 5,
                sharesCount: 8,
                isFavorite: false
            )
        ]
        loadTask = Task {
            try? await Task.sleep(nanoseconds: 2_000_000_000) // 2 seconds
            guard !Task.isCancelled else {
                return
            }
            await MainActor.run {
                self.isLoading = false
            }
        }
    }

    deinit {
        loadTask?.cancel()
    }
}
