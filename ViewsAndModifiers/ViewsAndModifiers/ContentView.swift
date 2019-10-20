//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Phetrungnapha, Kittisak (Agoda) on 19/10/2562 BE.
//  Copyright © 2562 Phetrungnapha, Kittisak (Agoda). All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GridStack(rows: 4, columns: 4) { row, col in
            Image(systemName: "\(row * 4 + col).circle")
            Text("R\(row) C\(col)")
        }
    }
}

struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    let content: (Int, Int) -> Content
    
    init(rows: Int, columns: Int, @ViewBuilder content: @escaping (Int, Int) -> Content) {
        self.rows = rows
        self.columns = columns
        self.content = content
    }
    
    var body: some View {
        VStack {
            ForEach(0 ..< rows) { row in
                HStack {
                    ForEach(0 ..< self.columns) { column in
                        self.content(row, column)
                    }
                }
            }
        }
    }
}

struct TitleView: ViewModifier {
    let text: String
    
    func body(content: Content) -> some View {
        ZStack {
            content
                .frame(width: 400.0, height: 400.0)
            Text(text)
                .foregroundColor(Color.blue)
        }
    }
}

extension View {
    func makeTitleView(with text: String) -> some View {
        self.modifier(TitleView(text: text))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
