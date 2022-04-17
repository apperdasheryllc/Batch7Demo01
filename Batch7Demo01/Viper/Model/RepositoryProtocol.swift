//
//  RepositoryProtocol.swift
//  Batch7Demo01
//
//  Created by Suneeth on 4/16/22.
//

import Foundation

public protocol Repository {
    associatedtype T
    associatedtype K
    func add(item: T)
    func update(index: K, item: T)
    func delete(index: K)
}
