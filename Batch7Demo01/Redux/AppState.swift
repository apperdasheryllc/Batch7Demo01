//
//  AppState.swift
//  Batch7Demo01
//
//  Created by Graham Diehl on 4/13/22.
//

/// Updates the App State based on the User Action

import Foundation

struct AppState: State {
    var transactions: [Transaction] = []
}

struct UpdateAction: Action {
    let interactor: Interactor
}

func appReducer(_ action: Action, _ state: State?) -> State {
    var newState = state as? AppState ?? AppState()
    switch action {
    case let action as UpdateAction:
        newState.transactions = action.interactor.model.transactions
    default:
        break
    }
    return newState
}
