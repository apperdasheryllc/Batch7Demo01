//
//  AppState.swift
//  Batch7Demo01
//
//  Created by Graham Diehl on 4/13/22.
//

import Foundation

// replace this placeholder struct with actual implementation by Suneeth
struct ReplaceMeTransaction {
    let date: Date
    let title: String
    let amount: Int
}

struct AppState: State {
    var transactions: [ReplaceMeTransaction] = []
}

struct InsertAction: Action {
    let insertTransaction: ReplaceMeTransaction
}

struct DecreaseAction: Action {
    let deleteTransaction: ReplaceMeTransaction
}

func appReducer(_ action: Action, _ state: State?) -> State {
    var newState = state as? AppState ?? AppState()
    
    switch action {
    case let action as InsertAction:
        //newState.counter += action.increaseBy
        newState.transactions.insert(action.insertTransaction, at: 0)
        
    case let action as DecreaseAction:
        //newState.counter -= action.decreaseBy
        if newState.transactions.count > 0 {
            newState.transactions.remove(at: 0)
        }
        
    default:
        break
    }
    return newState
}
