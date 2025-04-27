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

enum PSIcon {
    case addFriends
    case addNewContent
    case chats
    case close
    case comments
    case favorite
    case home
    case like
    case menu
    case `private`
    case profile
    case reels
    case search
    case search2
    case seeMore
    case share
    case tabAddNew

    var systemName: String {
        switch self {
        case .addFriends:
            return "person.badge.plus"
        case .addNewContent:
            return "plus.app"
        case .chats:
            return "ellipses.bubble"
        case .close:
            return "xmark"
        case .comments:
            return "message"
        case .favorite:
            return "star"
        case .home:
            return "house"
        case .like:
            return "heart"
        case .menu:
            return "line.3.horizontal"
        case .private:
            return "lock"
        case .profile:
            return "person.crop.circle"
        case .reels:
            return "movieclapper"
        case .search:
            return "text.magnifyingglass.rtl"
        case .search2:
            return "magnifyingglass"
        case .seeMore:
            return "ellipsis"
        case .share:
            return "paperplane"
        case .tabAddNew:
            return "plus.app.fill"
        }
    }
}

extension PSIcon: CustomStringConvertible {
    var description: String {
        systemName
    }
}

// MARK: - Accessibility

extension PSIcon {
    var accessibilityLabel: String {
        switch self {
        case .addFriends:
            return "Sugestões de amigos"
        case .addNewContent:
            return "Adiciona novo conteúdo"
        case .chats:
            return "Conversas"
        case .close:
            return "Fechar"
        case .comments:
            return "Comentários"
        case .favorite:
            return "Favoritar"
        case .home:
            return "Início"
        case .like:
            return "Curtir"
        case .menu:
            return "Menu"
        case .private:
            return "Privado"
        case .profile:
            return "Perfil"
        case .reels:
            return "Reels"
        case .search:
            return "Pesquisar"
        case .search2:
            return "Pesquisar"
        case .seeMore:
            return "Ver mais"
        case .share:
            return "Compartilhar"
        case .tabAddNew:
            return "Adicionar novo conteúdo"
        }
    }
}

struct PSIconHolder: View {
    private let icon: PSIcon
    private let scale: Image.Scale
    var body: some View {
        Image(systemName: icon.systemName)
            .imageScale(scale)
            .accessibilityLabel(icon.accessibilityLabel)
    }

    init(icon: PSIcon, scale: Image.Scale = .medium) {
        self.icon = icon
        self.scale = scale
    }
}
