//
//  ViewControllerUITests.swift
//  Batch7Demo01UITests
//
//  Created by Graham Diehl on 4/19/22.
//

import XCTest
@testable import Batch7Demo01

class ViewControllerUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample_WhenViewLoaded_RequiredUIElementsAreEnabled() throws {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let app = XCUIApplication()
        
        let name = app.textFields["transaction.title"]
        let amount = app.textFields["transaction.amount"]
        
        XCTAssertTrue(name.isEnabled, "Transaction name text field is not enabled.")
        XCTAssertTrue(amount.isEnabled, "Transaction amount text field is not enabled.")
        
        
    }

    func testWhenViewLoaded_ButtonsAreDisabled(){
        
        
        let app = XCUIApplication()
        
        let depositButton = app.buttons["transaction.add"]
        XCTAssertTrue(depositButton.isEnabled, "Deposit button is enabled.")
        
        let withdrawalButton = app.buttons["transaction.delete"]
        XCTAssertTrue(withdrawalButton.isEnabled, "Withdrawal button is enabled.")
        
    }
    
    
    func testViewController_WhenAddingDeposit_BalanceIncreases(){
        // Arrange
        
        let app = XCUIApplication()
        
        let name = app.textFields["transaction.title"]
        name.tap()
        name.typeText("Test")
        
        let amount = app.textFields["transaction.amount"]
        amount.tap()
        amount.typeText("200")
        
        let depositButton = app.buttons["transaction.add"]
        
        
        // Act
        depositButton.tap()
        
        // Assert
        XCTAssertTrue(app.staticTexts["balance.value"].label == "$200", "Transaction deposit does not increment as expected.")
        
    }
    
    
    func testViewController_WhenAddingWithdrawal_BalanceDecreases(){
        // Arrange
        
        let app = XCUIApplication()
        
        let name = app.textFields["transaction.title"]
        name.tap()
        name.typeText("Test")
        
        let amount = app.textFields["transaction.amount"]
        amount.tap()
        amount.typeText("200")
        
        let depositButton = app.buttons["transaction.delete"]
        
        
        // Act
        depositButton.tap()
        
        // Assert
        XCTAssertTrue(app.staticTexts["balance.value"].label == "$-200", "Transaction withdrawal does not increment as expected.")
        
    }
}
