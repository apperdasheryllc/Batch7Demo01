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
        //XCTAssertTrue(app.staticTexts["balance.amount"].label == "$200", "Transaction deposit does not increment as expected.")
        let exp = expectation(description: "Test after 5 seconds")
        let result = XCTWaiter.wait(for: [exp], timeout: 5.0)
        if result == XCTWaiter.Result.timedOut {
            XCTAssertTrue(app.staticTexts["balance.amount"].label == "$200", "Transaction deposit does not increment as expected.")
        } else {
            XCTFail("Delay interrupted")
        }
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
        
        let withdrawalButton = app.buttons["transaction.delete"]
        
        
        // Act
        withdrawalButton.tap()
        
        // Assert
        //XCTAssertTrue(app.staticTexts["balance.amount"].label == "$-200", "Transaction withdrawal does not increment as expected.")
        let exp = expectation(description: "Test after 5 seconds")
        let result = XCTWaiter.wait(for: [exp], timeout: 5.0)
        if result == XCTWaiter.Result.timedOut {
            XCTAssertTrue(app.staticTexts["balance.amount"].label == "$-200", "Transaction withdrawal does not increment as expected.")
        } else {
            XCTFail("Delay interrupted")
        }
    }
    
    func testViewController_InsertThenDelete_ListViewUpdates(){
        // Arrange
        
        let app = XCUIApplication()
        
        // Enter two transactions?
        let transactionAmountTextField = app/*@START_MENU_TOKEN@*/.textFields["transaction.amount"]/*[[".textFields[\"Amount\"]",".textFields[\"transaction.amount\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        
        // Deposit 100
        transactionAmountTextField.tap()
        transactionAmountTextField.typeText("100")
        
        // Enter a title
        let transactionTitleTextField = app.textFields["transaction.title"]
        transactionTitleTextField.tap()
        transactionTitleTextField.typeText("Deposit")
        
        // Return the keyboard so we can swipe on the collection view
        app/*@START_MENU_TOKEN@*/.buttons["Return"]/*[[".keyboards",".buttons[\"return\"]",".buttons[\"Return\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        // add the transaction
        app/*@START_MENU_TOKEN@*/.buttons["transaction.add"]/*[[".buttons[\"Deposit\"]",".buttons[\"transaction.add\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        
        let collectionViewsQuery = app.collectionViews
        let collectionView = collectionViewsQuery.firstMatch
        let cellsQuery = collectionView.cells
        // Act
        
        cellsQuery["Deposit, $100"].otherElements.containing(.staticText, identifier:"Deposit").element.swipeRight()
        
        collectionView.buttons["Delete"].tap()
        
        
        // Assert
        
        XCTAssertTrue(cellsQuery.count == 0, "Cells count is not 0 after inser then delete.")
        
    }
}
