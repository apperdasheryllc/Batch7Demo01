//
//  Presenter.swift
//  Batch7Demo01
//
//  Created by Graham Diehl on 4/13/22.
//

import Foundation

struct Presenter {
    
    let store: Store

    init(){
        store = Store(reducer: appReducer, state: nil)
    }
    
    func calculateBalance(transactions: [ReplaceMeTransaction]) -> Int {
        var value = 0
        
        // use combine here instead of for each?
        transactions.publisher.sink { transaction in
            value += transaction.amount
        }
        
        return value
    }
    
    func handleTap(){
        // TO DO: replace this with the actual interactor entity
        let testTransaction = ReplaceMeTransaction(date: Date(), title: "Test Transaction", amount: 10)
        store.dispatch(action: InsertAction(insertTransaction: testTransaction))
    }
    
}
