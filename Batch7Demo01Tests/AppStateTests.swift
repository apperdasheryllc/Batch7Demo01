//
//  AppStateTests.swift
//  Batch7Demo01Tests
//
//  Created by Graham Diehl on 4/13/22.
//

import XCTest
@testable import Batch7Demo01

class AppStateTests: XCTestCase, StoreSubscriber {

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

    
    func testAppState_Initialization(){
        let appState = AppState()
        XCTAssertTrue(appState.transactions.isEmpty)
    }
    
    func testAppState_Dispatch_Change(){
        let dataModel = DataModel()
        let interactor = Interactor(model: dataModel)
        let presenter = Presenter(interactor: interactor)
        presenter.store.subscribe(self)
        let title = "Test Transaction"
        let amount = 25
        let type: TransactionType = .deposit
        interactor.add(name: title, amount: amount, type: type)
        print("balance \(interactor.model.balance)")
        presenter.store.dispatch(action: UpdateAction(interactor: interactor))
    }
    
    func newState(state: State) {
        guard let appState = state as? AppState else {
            XCTFail()
            return
        }
        XCTAssertFalse(appState.transactions.isEmpty, "Expected to find app state transactions.")
    }
    
}
