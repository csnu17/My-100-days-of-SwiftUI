//
//  ContentView.swift
//  UnitConverter
//
//  Created by Phetrungnapha, Kittisak (Agoda) on 16/10/2562 BE.
//  Copyright © 2562 Phetrungnapha, Kittisak (Agoda). All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var inputUnitIndex = 0
    @State private var outputUnitIndex = 0
    @State private var input = "0"
    
    private let units: [(String, UnitTemperature)] = [("Celsius", .celsius),
                                                        ("Fahrenheit", .fahrenheit),
                                                        ("Kelvin", .kelvin)
    ]
    
    private var output: Double {
        let inputNumber = Double(input) ?? 0
        let inputUnit = units[inputUnitIndex].1
        let outputUnit = units[outputUnitIndex].1
        let inputMeasurement = Measurement(value: inputNumber, unit: inputUnit)
        let output = inputMeasurement.converted(to: outputUnit)
        return output.value
    }
    
    var body: some View {
        Form {
            Section(header: Text("Input Unit")) {
                Picker("", selection: $inputUnitIndex) {
                    ForEach(0 ..< units.count) {
                        Text("\(self.units[$0].0)")
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            
            Section(header: Text("Output Unit")) {
                Picker("", selection: $outputUnitIndex) {
                    ForEach(0 ..< units.count) {
                        Text("\(self.units[$0].0)")
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            
            Section(header: Text("Input Temperature")) {
                TextField("", text: $input)
                    .keyboardType(.decimalPad)
            }
            
            Section(header: Text("Output Temperature")) {
                Text("\(output, specifier: "%g")")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
