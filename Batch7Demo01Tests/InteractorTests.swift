//
//  InteractorTests.swift
//  Batch7Demo01Tests
//
//  Created by Suneeth on 4/15/22.
//

import XCTest
@testable import Batch7Demo01

class InteractorTests: XCTestCase {
    var interactor: Interactor!
    override func setUp() {
        super.setUp()
        interactor = Interactor(model: DataModel())
    }
    func testInteractor_WhenTrasanction_Added() {
        XCTAssertTrue(interactor.model.transactions.isEmpty)
        interactor.add(name: "test", amount: 3, type: .deposit)
        XCTAssertFalse(interactor.model.transactions.isEmpty)
    }
    func testInteractor_WhenTrasanction_Updated() {
        testInteractor_WhenTrasanction_Added()
        let title = try! XCTUnwrap(interactor.model.transactions.first?.title)
        XCTAssertEqual(title, "test")
        interactor.update(at: 0, title: "updated", amount: 4, type: .deposit)
        let updatedTitle = try! XCTUnwrap(interactor.model.transactions.first?.title)
        XCTAssertEqual(updatedTitle, "updated")
    }
    func testInteractor_WhenTrasanction_Deleted() {
        XCTAssertTrue(interactor.model.transactions.isEmpty)
        testInteractor_WhenTrasanction_Added()
        XCTAssertFalse(interactor.model.transactions.isEmpty)
        interactor.model.delete(index: 0)
        XCTAssertTrue(interactor.model.transactions.isEmpty)
    }
}
