//
//  ContentView.swift
//  TipsApp
//
//  Created by Luis Esteban Haro on 12/05/24.
//
import SwiftUI

struct TipCalculator {
    var billAmount: Double
    var tipPercentage: Double

    init(billAmount: Double, tipPercentage: Double) {
        self.billAmount = billAmount
        self.tipPercentage = tipPercentage
    }

    func calculateTip() -> Double? {
        guard billAmount >= 0 else {
            return nil
        }

        if [0.0, 10.0, 15.0, 20.0].contains(tipPercentage) {
            return billAmount * tipPercentage / 100
        } else {
            return nil
        }
    }

    func calculateTotal() -> Double? {
        if let tip = calculateTip() {
            return billAmount + tip
        } else {
            return nil
        }
    }
}


struct ContentView: View {
    @State private var billAmount: Double = 0
    @State private var tipPercentage: Double = 15

    var body: some View {
        VStack {
            Text("Tip Calculator")
                .font(.title)
                .padding()
            
            Spacer()

            TextField("Enter bill amount", value: $billAmount, formatter: NumberFormatter())
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Text("Tip Percentage: \(Int(tipPercentage))%")
                .padding()

            HStack {
                ForEach([0.0, 10.0, 15.0, 21.0], id: \.self) { percentage in
                    Button("\(Int(percentage))%") {
                        self.tipPercentage = percentage
                    }
                    .padding()
                }
            }

            let calculator = TipCalculator(billAmount: billAmount, tipPercentage: tipPercentage)

            Text("Tip: $\(calculator.calculateTip() ?? 0.0, specifier: "%.2f")")
                .padding()

            Text("Total: $\(calculator.calculateTotal() ?? 0.0, specifier: "%.2f")")
                .padding()

            Spacer()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

