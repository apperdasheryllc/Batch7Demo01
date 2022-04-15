//
//  Presenter.swift
//  Batch7Demo01
//
//  Created by Graham Diehl on 4/13/22.
//

import SwiftUI
import Combine

class Presenter {
    
    let store: Store
    private let interactor: Interactor
    @Published var transactions: [Transaction] = []
    private var cancellables = Set<AnyCancellable>()
    var balance: Int = 0
    init(interactor: Interactor){
        store = Store(reducer: appReducer, state: nil)
        self.interactor = interactor
        self.interactor.model.$transactions
            .assign(to: \.transactions, on: self)
            .store(in: &cancellables)
        
        self.interactor.model.$transactions
            .map { transactions in
                transactions.map { transaction in
                    return transaction.amount
                }.reduce(0, +)
            }
            .assign(to: \.balance, on: self)
            .store(in: &cancellables)
    }
    
    /// Calculate the balance of an array of Transactions
    func calculateBalance(transactions: [Transaction]) -> Int {
        var value = 0
        
        // use combine here instead of for each?
        transactions.publisher.sink { transaction in
            value += transaction.amount
        }.store(in: &cancellables)
        
        return value
    }
    
    /// Add a new transaction to the data model
    func add(with title: String, amount: Int, type: TransactionType) {
        interactor.add(name: title, amount: amount, type: type)
        print("balance \(interactor.model.balance)")
        store.dispatch(action: UpdateAction(interactor: interactor))
    }
    
    // Delete a transaction from the data model
    func delete(at index: Int) {
        interactor.delete(index: index)
        store.dispatch(action: UpdateAction(interactor: interactor))
    }
    
    // Update a transaction in the data model
    func update(at index: Int, title: String, amount: Int) {
        interactor.update(at: index, title: title, amount: amount, type: .withdrawl)
        store.dispatch(action: UpdateAction(interactor: interactor))
    }
}
