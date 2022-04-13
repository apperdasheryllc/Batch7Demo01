//
//  AppState.swift
//  Batch7Demo01
//
//  Created by Graham Diehl on 4/13/22.
//

import Foundation

struct AppState: State {
    var transactions: [Transaction] = []
}

struct InsertAction: Action {
    let insertTransaction: Transaction
}

struct DecreaseAction: Action {
    let deleteTransaction: Transaction
}

func appReducer(_ action: Action, _ state: State?) -> State {
    var newState = state as? AppState ?? AppState()
    
    switch action {
    case let action as InsertAction:
        //newState.counter += action.increaseBy
        newState.transactions.insert(action.insertTransaction, at: 0)
        
    case _ as DecreaseAction:
        //newState.counter -= action.decreaseBy
        if newState.transactions.count > 0 {
            newState.transactions.remove(at: 0)
        }
        
    default:
        break
    }
    return newState
}
