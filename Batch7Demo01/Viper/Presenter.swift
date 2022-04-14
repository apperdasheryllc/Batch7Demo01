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
    
    func calculateBalance(transactions: [Transaction]) -> Int {
        var value = 0
        
        // use combine here instead of for each?
        transactions.publisher.sink { transaction in
            value += transaction.amount
        }.store(in: &cancellables)
        
        return value
    }
    
    func handleTap(){
        // TO DO: replace this with the actual interactor entity
        let testTransaction = Transaction(title: "Test Transaction", amount: 10, type: .deposit)
        store.dispatch(action: InsertAction(insertTransaction: testTransaction))
    }
    func add(with title: String, amount: Int) {
        interactor.add(name: title, amount: amount, type: .deposit)
        print("balance \(interactor.model.balance)")
    }
    func delete(at index: Int) {
        interactor.delete(index: index)
    }
    func update(at index: Int, title: String, amount: Int) {
        interactor.update(at: index, title: title, amount: amount, type: .withdrawl)
    }
}
