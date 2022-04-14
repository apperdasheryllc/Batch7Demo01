//
//  Interactor.swift
//  Batch7Demo01
//
//  Created by Suneeth on 4/13/22.
//

import Foundation

class Interactor {
  let model: DataModel
    init(model: DataModel) {
        self.model = model
    }
    func add(name: String, amount: Int, type: TransactionType) {
        let transaction = Transaction(title: name, amount: amount, type: type)
        model.add(transaction: transaction)
    }
    func delete(index: Int) {
        model.delete(index: index)
    }
    func update(at index: Int, title: String, amount: Int, type: TransactionType) {
        let transaction = Transaction(title: title, amount: amount, type: type)
        model.update(index: index, updated: transaction)
    }
}
