//
//  LoginView.swift
//  PhotoShare
//
//  Created by Dielson Sales de Carvalho on 20/07/24.
//

import SwiftUI

final class LoginVieModel: ObservableObject {
    @Published var username = ""
    @Published var password = ""
}

struct LoginView: View {
    @ObservedObject var loginManager: LoginManager
    @StateObject var loginModel = LoginVieModel()

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
                    loginManager.login()
                }
                .frame(maxWidth: .infinity)
                .padding()
                .foregroundStyle(.white)
                .background(Color(UIColor(_colorLiteralRed: 0.29, green: 0.77, blue: 1, alpha: 1)))
                .cornerRadius(8)
            }
            .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
            Spacer()
            Rectangle()
                .frame(height: 0.5)
                .foregroundStyle(Color(UIColor.secondaryLabel))
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
    LoginView(loginManager: LoginManager())
        .modelContainer(for: Item.self, inMemory: true)
}
