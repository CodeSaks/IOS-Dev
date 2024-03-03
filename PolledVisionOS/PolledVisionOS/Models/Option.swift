//
//  Option.swift
//  PolledVisionOS
//
//  Created by Spartan on 3/3/24.
//

import Foundation

struct Option: Codable, Identifiable, Hashable {
    var id = UUID().uuidString
    var count: Int
    var name: String
}
