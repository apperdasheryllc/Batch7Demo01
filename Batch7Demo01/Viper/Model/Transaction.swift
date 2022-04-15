//
//  Transaction.swift
//  Batch7Demo01
//
//  Created by Suneeth on 4/13/22.
//

import Foundation

enum TransactionType: Int {
    case deposit
    case withdrawl
}
struct Transaction {
    let title: String
    let amount: Int
    let type: TransactionType
    let date: Date
    
    init(title: String, amount: Int,type: TransactionType, date: Date = Date()) {
        self.title = title
        self.amount = (type == .deposit) ?  amount : -amount
        self.type = type
        self.date = date
    }
}

extension Transaction: Hashable { }

extension Transaction: CustomStringConvertible {
    var description: String {
        return "Transaction on \(date) named \(title) for amount \(amount)"
    }
}
