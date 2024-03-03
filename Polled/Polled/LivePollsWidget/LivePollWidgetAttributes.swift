//
//  LivePollWidgetAttributes.swift
//  Polled
//
//  Created by Spartan on 3/1/24.
//

import ActivityKit
import Foundation

struct LivePollsWidgetAttributes: ActivityAttributes {
    
    typealias ContentState = Poll

    public var pollId: String
    init(pollId: String) {
        self.pollId = pollId
    }
}
