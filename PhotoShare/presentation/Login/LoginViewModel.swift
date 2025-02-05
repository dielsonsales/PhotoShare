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

@MainActor
final class LoginViewModel: ObservableObject {

    enum LoginState {
        case loading
        case userIsLoggedIn
        case userIsLoggedOut
    }

    @Published var currentState: LoginState = .loading

    // MARK: - Initializer

    init() {
        Task {
            await checkLoginStatus()
        }
    }

    // MARK: - Public methods

    func login(username: String, password: String) async {
        do {
            guard try await NetworkChecker.isServerAvailable() else {
                Logger.logError("Server health isn't ok")
                return
            }
            try await User.login(username: username,password: password)
            await MainActor.run {
                withAnimation {
                    self.currentState = .userIsLoggedIn
                }
            }
        } catch {
            await MainActor.run {
                // TODO:
                print("Error is \(error.localizedDescription)")
            }
        }
    }

    // MARK: - Private methods

    private func checkLoginStatus() async {
        async let currentUser: User? = try? User.current()
        withAnimation {
            self.currentState = .loading
        }
        let userIsLoggedIn = await currentUser != nil
        if userIsLoggedIn {
            withAnimation {
                self.currentState = .userIsLoggedIn
            }
        } else {
            withAnimation {
                self.currentState = .userIsLoggedOut
            }
        }
    }

}
