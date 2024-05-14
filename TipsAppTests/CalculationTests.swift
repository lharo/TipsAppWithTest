//
//  CalculationTests.swift
//  TipsAppTests
//
//  Created by Luis Esteban Haro on 12/05/24.
//

import XCTest
@testable import TipsApp

final class CalculationTests: XCTestCase {
    
    func testSuccesfulTipCalculationFifteenPercent(){
        // Given
        let amount = 100.0
        let tipPercentage = 15.0
        
        // When
        let calculator: TipCalculator = TipCalculator(billAmount: amount, tipPercentage: tipPercentage)

        // Then
        XCTAssertEqual(calculator.calculateTip(), 15.0)
    }
 
    func testCalculateTotal() {
        // Given
        let amount = 100.0
        let tipPercentage = 15.0
        
        // When
        let calculator = TipCalculator(billAmount: amount, tipPercentage: tipPercentage)

        // Then
        XCTAssertEqual(calculator.calculateTotal(), 115.0)
    }

    func testValidPercentageGiven() {
        // Given
        let amount = 100.0
        let invalidTipPercentage = 25.0
        
        // When
        let calculator = TipCalculator(billAmount: amount, tipPercentage: invalidTipPercentage)
        
        // Then
        XCTAssertNil(calculator.calculateTip(), "Expected calculateTip() to return nil for invalid tip percentage")
    }
    
    func testNegativeBillAmountGuard() {
        // Given
        let negativeBillAmount = -100.0
        let tipPercentage = 15.0
        
        // When
        let calculator = TipCalculator(billAmount: negativeBillAmount, tipPercentage: tipPercentage)
        
        // Then
        XCTAssertNil(calculator.calculateTip(), "Expected calculateTip() to return nil for negative bill amount")
    }

}
