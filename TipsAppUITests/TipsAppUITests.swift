//
//  TipsAppUITests.swift
//  TipsAppUITests
//
//  Created by Luis Esteban Haro on 12/05/24.
//

import XCTest

class TipCalculatorUITests: XCTestCase {

    var app: XCUIApplication!

    override func setUp() {
        super.setUp()
        
        // Setting up the UI test by launching the app
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    func testCalculateTipFifteenPercent() {
        // Accessing the bill amount text field and entering the bill amount
        let billAmountTextField = app.textFields["Enter bill amount"]
        billAmountTextField.tap()
        billAmountTextField.typeText("100")

        // Tapping on the 15% button to select the tip percentage
        app.buttons["15%"].tap()

        // Verifying that the tip label displays the correct value
        let tipLabel = app.staticTexts["Tip: $15.00"]
        XCTAssertTrue(tipLabel.exists)

        // Verifying that the total label displays the correct value
        let totalLabel = app.staticTexts["Total: $115.00"]
        XCTAssertTrue(totalLabel.exists)
    }
    
    func testNegativeValuesNotAllowed() {
        // Accessing the bill amount text field and entering a negative value
        let billAmountTextField = app.textFields["Enter bill amount"]
        billAmountTextField.tap()
        billAmountTextField.typeText("-100")

        // Tapping on the 15% button to select the tip percentage
        app.buttons["15%"].tap()

        // Verifying that the tip label displays 0.00
        let tipLabel = app.staticTexts["Tip: $0.00"]
        XCTAssertTrue(tipLabel.exists)

        // Verifying that the total label displays 0.00
        let totalLabel = app.staticTexts["Total: $0.00"]
        XCTAssertTrue(totalLabel.exists)
    }

}
