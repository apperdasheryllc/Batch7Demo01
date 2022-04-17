//
//  DataModelTests.swift
//  Batch7Demo01Tests
//
//  Created by Suneeth on 4/15/22.
//

import XCTest
@testable import Batch7Demo01

class DataModelTests: XCTestCase {
    var dataModel: DataModel!
    override func setUp() {
        super.setUp()
        dataModel = DataModel()
    }
    func testDataModel_WhenNoData() {
        XCTAssertNotNil(dataModel)
        XCTAssertNotNil(dataModel.transactions)
        XCTAssertTrue(dataModel.transactions.isEmpty)
    }
    func testDataModel_WhenTransaction_Added() {
        let transaction = Transaction(title: "test", amount: 5, type: .deposit)
        XCTAssertTrue(dataModel.transactions.isEmpty)
        dataModel.add(item: transaction)
        XCTAssertFalse(dataModel.transactions.isEmpty)
        XCTAssertEqual(dataModel.transactions.count, 1)
    }
    func testDataModel_WhenTransaction_Deleted() {
        testDataModel_WhenTransaction_Added()
        dataModel.delete(index: 0)
        XCTAssertTrue(dataModel.transactions.isEmpty)
    }
    func testDataModel_WhenTransaction_Updated() throws {
        testDataModel_WhenTransaction_Added()
        let title = try! XCTUnwrap(dataModel.transactions.first?.title)
        XCTAssertEqual(title, "test")
        let updatedTransaction = Transaction(title: "updated", amount: 10, type: .deposit)
        dataModel.update(index: 0, item: updatedTransaction)
        let updatedTitle = try! XCTUnwrap(dataModel.transactions.first?.title)
        XCTAssertEqual(updatedTitle, "updated")
    }
}
