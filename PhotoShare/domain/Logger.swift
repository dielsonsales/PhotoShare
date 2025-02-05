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

import Foundation

/**
  Logs messages to the console with relevant information.
 */
final class Logger {
    /**
     Logs a message to the console with the current date and time.
     */
    static func log(_ message: String) {
        log(message, sign: "🔹")
    }

    /**
     Logs a warning message to the console with the current date and time.
     */
    static func logWarning(_ message: String) {
        log(message, sign: "⚠️")
    }

    /**
     Logs an error message to the console with the current date and time.
     */
    static func logError(_ message: String) {
        log(message, sign: "❌")
    }

    // MARK: - Private methods

    /**
     Logs a message to the console with information about the current file, line, and column.
     */
    private static func log(
        _ message: String,
        sign: String,
        file: String = #file,
        line: Int = #line,
        column: Int = #column
    ) {
        print("🔹 \(Date()) \(file) (\(line), \(column)): \(message)")
    }
}
