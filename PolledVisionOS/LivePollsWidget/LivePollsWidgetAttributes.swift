//
//  LivePollsWidgetAttributes.swift
//  PolledVisionOS
//
//  Created by Spartan on 3/3/24.
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
