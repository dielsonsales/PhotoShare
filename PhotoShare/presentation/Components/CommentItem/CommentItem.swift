//  PhotoShare
//  Copyright (C) 2025  Dielson Sales de Carvalho.
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

struct CommentItem: View {
    @StateObject var viewModel: CommentItemViewModel

    var body: some View {
        HStack(alignment: .top, spacing: 8) {
            PSImageView()
                .frame(width: 30, height: 30)
                .cornerRadius(15)
            VStack {
                VStack(alignment: .leading) {
                    Text("Marcos Oliveira")
                        .font(.headline)
                    Text("Que legal!")
                        .font(.body)

                }
                .padding()
            }
            .background(Color(UIColor.secondarySystemBackground))
            .cornerRadius(20)
            Spacer()
        }
        .padding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8))
    }
}
