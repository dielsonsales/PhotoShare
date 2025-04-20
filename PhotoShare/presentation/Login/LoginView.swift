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

import SwiftUI

final class LoginModel: ObservableObject {
    @Published var username = ""
    @Published var password = ""
}

struct LoginView: View {
    @ObservedObject var viewModel: LoginViewModel
    @StateObject var loginModel = LoginModel()

    var body: some View {
        VStack {
            Spacer()
            VStack {
                Text("PhotoShare")
                    .font(.title)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 40, trailing: 0))
                TextField("Phone number, username or email", text: $loginModel.username)
                    .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                    .background(Color(UIColor.secondarySystemBackground))
                    .textInputAutocapitalization(.never)
                    .overlay(RoundedRectangle(cornerRadius: 5).stroke(.gray, lineWidth: 0.5))
                    .padding(EdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2))
                SecureField("Password", text: $loginModel.password)
                    .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                    .background(Color(UIColor.secondarySystemBackground))
                    .textInputAutocapitalization(.never)
                    .overlay(RoundedRectangle(cornerRadius: 5).stroke(.gray, lineWidth: 0.5))
                    .padding(EdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2))
                HStack {
                    Button("Forgot password?") {
                        // TODO:
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                }
                .frame(maxWidth: .infinity)
                .padding(EdgeInsets(top: 10, leading: 0, bottom: 40, trailing: 0))

                Button("Log in") {
                    Task {
                        await viewModel.login(
                            username: loginModel.username,
                            password: loginModel.password
                        )
                    }
                }
                .frame(maxWidth: .infinity)
                .padding()
                .foregroundStyle(.white)
                .background(Color(UIColor(_colorLiteralRed: 0.29, green: 0.77, blue: 1, alpha: 1)))
                .cornerRadius(8)
            }
            .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
            Spacer()
            PSSeparator()
            HStack {
                Text("Don't have an account?")
                    .font(.subheadline)
                    .foregroundStyle(Color(UIColor.secondaryLabel))
                    .padding(EdgeInsets(top: 20, leading: 0, bottom: 20, trailing: 0))
                Button("Sign up") {
                    // TODO:
                }
                .padding(EdgeInsets(top: 20, leading: 0, bottom: 20, trailing: 0))
            }
            .frame(maxWidth: .infinity)
        }
    }
}

#Preview {
    LoginView(viewModel: LoginViewModel())
        .modelContainer(for: Item.self, inMemory: true)
}
