//
//  Item.swift
//  PhotoShare
//
//  Created by Dielson Sales de Carvalho on 20/07/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date

    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
