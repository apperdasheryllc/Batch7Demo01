//
//  PresenterTests.swift
//  Batch7Demo01Tests
//
//  Created by Graham Diehl on 4/13/22.
//

import XCTest
@testable import Batch7Demo01

class PresenterTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    func testPresenter_Initialization_StoreNotNill(){
        let dataModel = DataModel()
        let interactor = Interactor(model: dataModel)
        let presenter = Presenter(interactor: interactor)
        XCTAssertNotNil(presenter.store)
    }
    
    func testPresenter_InsertAction_ShouldUpdateBalance(){
        let dataModel = DataModel()
        let interactor = Interactor(model: dataModel)
        let presenter = Presenter(interactor: interactor)
        //presenter.handleTap()
        presenter.add(with: "Test 1", amount: 20, type: .deposit)
        presenter.add(with: "Test 2", amount: 30, type: .deposit)
        
        let balance = presenter.calculateBalance(transactions: presenter.transactions)
        XCTAssert(balance == 50)
    }
    
    func testPresenter_DeleteAction_ShouldUpdateTransactions(){
        let dataModel = DataModel()
        let interactor = Interactor(model: dataModel)
        let presenter = Presenter(interactor: interactor)
        //presenter.handleTap()
        presenter.add(with: "Test 1", amount: 20, type: .deposit)
        presenter.delete(at: 0)
        let balance = presenter.calculateBalance(transactions: presenter.transactions)
        XCTAssertTrue(balance == 0, "Expected balance to incremented, then deleted causing balance to be zero.")
    }
    
    func testPresenter_CalculateBalance(){
        let dataModel = DataModel()
        let interactor = Interactor(model: dataModel)
        let presenter = Presenter(interactor: interactor)
        let transaction1 = Transaction(title: "Test 1", amount: 25, type: .deposit)
        let transaction2 = Transaction(title: "Test 2", amount: 30, type: .deposit)
        let balance = presenter.calculateBalance(transactions: [transaction1, transaction2])
        XCTAssertEqual(balance, 55)
    }
    
    func testTransactionDescription_ShouldReturnString(){
        let transaction = Transaction(title: "Test 1", amount: 25, type: .deposit)
        XCTAssertNotNil(transaction.description)
        XCTAssertFalse(transaction.description.isEmpty)
    }
}
