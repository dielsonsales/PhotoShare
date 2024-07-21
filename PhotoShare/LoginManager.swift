//
//  LoginManager.swift
//  PhotoShare
//
//  Created by Dielson Sales de Carvalho on 20/07/24.
//

import SwiftUI

final class LoginManager: ObservableObject {
    @Published var isLoggedIn = false

    func login() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            withAnimation {
                self.isLoggedIn = true
            }
        }
    }
}
