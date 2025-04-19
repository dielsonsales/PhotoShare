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
import ParseSwift

struct Post: ParseObject {

    // MARK: - ParseObject properties
    var objectId: String?
    var createdAt: Date?
    var updatedAt: Date?
    var ACL: ParseACL?
    var originalData: Data?

    // MARK: - Post properties
    var user: Pointer<User>?
    var photo: ParseFile?
    var caption: String?
    var likesCount: Int?

    /**
     * Used for fast decoding after updating a ParseObject
     */
    func merge(with object: Post) throws -> Post {
        var updated = try mergeParse(with: object)
        if updated.shouldRestoreKey(\.photo, original: object) {
            updated.photo = object.photo
        }
        if updated.shouldRestoreKey(\.caption, original: object) {
            updated.caption = object.caption
        }
        if updated.shouldRestoreKey(\.likesCount, original: object) {
            updated.likesCount = object.likesCount
        }
        return updated
    }

}
