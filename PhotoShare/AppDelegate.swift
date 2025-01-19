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

import ParseSwift
import SwiftUI

class AppDelegate: NSObject, UIApplicationDelegate {

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
    ) -> Bool {
        Task {
            if let loadParseConfig = loadParseConfig() {
                try await ParseSwift.initialize(
                    applicationId: loadParseConfig["applicationId"] ?? "",
                    clientKey: loadParseConfig["clientKey"] ?? "",
                    serverURL: URL(string: loadParseConfig["serverURL"] ?? "")!
                )
            } else {
                // TODO: handle error, config couldn't be loaded
            }
        }
        return true
    }

    private func loadParseConfig() -> [String: String]? {
        if let url = Bundle.main.url(forResource: "ParseConfig", withExtension: "plist"),
           let data = try? Data(contentsOf: url),
           let plist = try? PropertyListSerialization.propertyList(
               from: data,
               options: [],
               format: nil
           ) as? [String: String] {
            return plist
        }
        return nil
    }

}
