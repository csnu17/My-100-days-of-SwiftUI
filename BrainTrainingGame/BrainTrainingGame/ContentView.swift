//
//  ContentView.swift
//  BrainTrainingGame
//
//  Created by Phetrungnapha, Kittisak (Agoda) on 22/10/2562 BE.
//  Copyright © 2562 Phetrungnapha, Kittisak (Agoda). All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    private let moves = ["Rock", "Paper", "Scissors"]
    
    @State private var currentChoice = Int.random(in: 0...2)
    @State private var shouldWin = Bool.random()
    @State private var score = 0
    @State private var numberOfPlayed = 0
    @State private var showAlert = false
    
    var body: some View {
        VStack(spacing: 10) {
            Text("Player's score: \(score)")
            Text("App's move: \(moves[currentChoice])")
            Text(shouldWin ? "Player should win!": "Player should lose!")
            
            Spacer()
                .frame(height: 50)
            
            ForEach(0 ..< 3) { number in
                Button("\(self.moves[number])") {
                    self.shouldIncreaseScore(move: self.moves[self.currentChoice],
                                             shouldWin: self.shouldWin,
                                             playerSelect: self.moves[number]
                    )
                    self.updateGame()
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .clipShape(Capsule())
                .font(.title)
            }
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Your end game score"), message: Text("\(score) points"), dismissButton: .default(Text("OK"), action: {
                self.resetGame()
            }))
        }
    }
    
    private func resetGame() {
        currentChoice = Int.random(in: 0...2)
        shouldWin = Bool.random()
        score = 0
        numberOfPlayed = 0
    }
    
    private func shouldIncreaseScore(move: String, shouldWin: Bool, playerSelect: String) {
        if shouldWin {
            switch (move, playerSelect) {
            case ("Rock", "Paper"),
                 ("Paper", "Scissors"),
                 ("Scissors", "Rock"):
                score += 1
            default:
                break
            }
            
        } else {
            switch (move, playerSelect) {
            case ("Rock", "Scissors"),
                 ("Paper", "Rock"),
                 ("Scissors", "Paper"):
                score += 1
            default:
                break
            }
        }
    }
    
    private func updateGame() {
        shouldWin = Bool.random()
        currentChoice = Int.random(in: 0...2)
        numberOfPlayed += 1
        showAlert = (numberOfPlayed == 10)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
