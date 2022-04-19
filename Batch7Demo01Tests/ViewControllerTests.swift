//
//  ViewControllerTests.swift
//  Batch7Demo01Tests
//
//  Created by Graham Diehl on 4/18/22.
//

import XCTest
@testable import Batch7Demo01

class ViewControllerTests: XCTestCase {
    
    var mainVC: ViewController!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        mainVC = ViewController()
        mainVC.loadViewIfNeeded()
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        mainVC = nil
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

    func testViewController_WhenCreated_HasTextFieldsEmpty() throws {
        
        let titleField = try XCTUnwrap(mainVC.transactionTitleField, "The transaction title field is not connected.")
        let amountField = try XCTUnwrap(mainVC.transactionAmountField, "The transaction amount field is not connected.")
        
        XCTAssertEqual(titleField.text, "", "Transaction Title Field is not empty")
        
        XCTAssertEqual(amountField.text, "", "Transaction Amount Field is not empty")
    }
    
    
    func testViewController_WhenCreated_HasDepositButtonAndAction() throws {
        let depositButton = try XCTUnwrap(mainVC.addButton)
        let depositButtonActions = depositButton.actions(forTarget: mainVC, forControlEvent: .touchUpInside)
        XCTAssertEqual(depositButton.allTargets.count, 1)
    }
    
    func testViewController_WhenCreated_HasWithdrawalButtonAndAction() throws {
        let withdrawalButton = try XCTUnwrap(mainVC.addButton)
        let withdrawalButtonActions = withdrawalButton.actions(forTarget: mainVC, forControlEvent: .touchUpInside)
        XCTAssertEqual(withdrawalButton.allTargets.count, 1)
    }
    
    func testViewController_TransactionListPerformQuery() throws {
        let listView = try XCTUnwrap(mainVC.transactionListView)
        //mainVC.configureTransactionList()
        mainVC.addTransactionListView()
        let transaction = Transaction(title: "Title Test 1", amount: 10, type: .deposit)
        mainVC.performQuery(transactions: [transaction])
        XCTAssertTrue(listView.numberOfItems(inSection: 0) == 1, "List does not have a trasaction row.")
    }
    
    func testViewController_BalanceViewUpdate() throws {
        //let balanceView = try XCTUnwrap(mainVC.balanceView)
        let balanceValueLabel = try XCTUnwrap(mainVC.balanceValueLabel)
        mainVC.addBalanceView()
        //let transaction = Transaction(title: "Balance Test", amount: 30, type: .deposit)
        XCTAssertTrue(balanceValueLabel.text == "0", "Balance is not equal to zero")
    }
}
