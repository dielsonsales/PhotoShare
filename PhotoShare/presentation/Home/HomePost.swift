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

class HomePost: ObservableObject, Identifiable {

    // MARK: - Attributes
    let id = UUID()
    var userDisplayName: String
    var username: String
    var userImageURL: String
    var imageURL: String
    var description: String
    var likesCount: Int
    var commentsCount: Int
    var sharesCount: Int
    var isFavorite: Bool

    // MARK: - Initializer
    init(
        userDisplayName: String,
        username: String,
        userImageURL: String,
        imageURL: String,
        description: String,
        likesCount: Int,
        commentsCount: Int,
        sharesCount: Int,
        isFavorite: Bool
    ) {
        self.userDisplayName = userDisplayName
        self.username = username
        self.userImageURL = userImageURL
        self.imageURL = imageURL
        self.description = description
        self.likesCount = likesCount
        self.commentsCount = commentsCount
        self.sharesCount = sharesCount
        self.isFavorite = isFavorite
    }

}
