//
//  ContentView.swift
//  BetterRest
//
//  Created by Phetrungnapha, Kittisak (Agoda) on 23/10/2562 BE.
//  Copyright © 2562 Phetrungnapha, Kittisak (Agoda). All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var sleepAmount = 8.0
    @State private var wakeUp = Date()
    
    var body: some View {
//        Stepper(value: $sleepAmount, in: 4...12, step: 0.25) {
//            Text("\(sleepAmount, specifier: "%g") hours")
//        }
        
        DatePicker("Please enter a date", selection: $wakeUp, in: Date()...)
            .labelsHidden()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
