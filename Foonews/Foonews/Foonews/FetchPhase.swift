//
//  FetchPhase.swift
//  Foonews
//
//  Created by Spartan on 2/28/24.
//

import Foundation

enum FetchPhase<T> {
    
    case intial
    case fetching
    case success(T)
    case failue(Error)
    
    var value: T?{
        
        if case.success(let t) = self {
            return t
        }
        return nil
    }
    
    var error: Error?{
        if case.failue(let error) = self {
            return error
        }
        return nil
    }
    
}
