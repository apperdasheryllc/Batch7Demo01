//
//  Store.swift
//  Batch7Demo01
//
//  Created by Graham Diehl on 4/13/22.
//


/// Redux store for updating the App State based on an Action

import Foundation


protocol Action {}

protocol State {}

typealias Reducer = (_ action: Action, _ state: State?) -> State

protocol StoreSubscriber {
    func newState(state: State)
}

class Store {
    let reducer: Reducer
    var state: State?
    
    var subscribers: [StoreSubscriber] = []
    
    init(reducer: @escaping Reducer, state: State?){
        self.reducer = reducer
        self.state = state
    }
    
    func dispatch(action: Action){
        state = reducer(action, state)
        subscribers.forEach { subscriber in
            subscriber.newState(state: state!)
        }
    }
    
    func subscribe(_ newSubscriber: StoreSubscriber){
        subscribers.append(newSubscriber)
    }
}
