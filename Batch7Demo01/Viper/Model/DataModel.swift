//
//  DataModel.swift
//  Batch7Demo01
//
//  Created by Suneeth on 4/13/22.
//

import Foundation
import Combine

final class DataModel {
    @Published var balance: Int = 0
    @Published var transactions: [Transaction] = []
    private var cancellables = Set<AnyCancellable>()
    func add(transaction: Transaction) {
        transactions.append(transaction)
    }
    func delete(index: Int) {
        if !transactions.isEmpty && index < transactions.count{
            transactions.remove(at: index)
        }
    }
    func update(index: Int, updated: Transaction) {
        if !transactions.isEmpty && index < transactions.count{
            transactions[index] = updated
        }
    }
}
