//
//  Option.swift
//  Polled
//
//  Created by Spartan on 3/1/24.
//

import Foundation

struct Option: Codable, Identifiable, Hashable {
    var id = UUID().uuidString
    var count: Int
    var name: String
}
