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

    @MainActor
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        Task {
            try await ParseSwift.initialize(
                applicationId: "5onbYhOGyHerCFFH7xy6cJ9PhEb65wq8alu2qHTw",
                clientKey: "UiH74QrjgzxokJetNGpjL7CHmeuO62oLoxvdaFBa",
                serverURL: URL(string: "https://parseapi.back4app.com/")!
            )
        }
        return true
    }

}
