//
//  ContentView.swift
//  ThiefPoliceGame
//
//  Created by Lakshaya Sachdeva on 19/10/23.
//

import SwiftUI

struct ContentView: View {
    let numRows = 4
    let numCols = 5
    
    @State private var grid: [[Character]] = Array(repeating: Array(repeating: " ", count: 5), count: 4)
    @State private var pRow: Int?
    @State private var pCol: Int?
    @State private var gRow: Int?
    @State private var gCol: Int?
    
    var body: some View {
        
        NavigationView {
            VStack(spacing: 60) {
                
                Button {
                    clearPreviousPositions()
                    placePT()
                } label: {
                    Text("Move")
                        .font(.title).bold()
                        .padding(.horizontal, 20)
                        .padding(.vertical, 10)
                        .foregroundColor(.black)
                        .border(.black, width: 5)
                        .cornerRadius(5)
                }
                .frame(width: 200)
                
                
                VStack {
                    ForEach(0..<numRows, id: \.self) { row in
                        HStack {
                            ForEach(0..<numCols, id: \.self) { col in
                                Text(String(grid[row][col]))
                                    .font(.system(size: 20).bold())
                                    .frame(width: 60, height: 60)
                                    .border(Color.white, width: 1)
                                    .background(Color.black)
                                    .foregroundColor(.white)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Catch the thief 🤠")
        }
    }
    
    func clearPreviousPositions() {
        if let pRow = pRow, let pCol = pCol {
            grid[pRow][pCol] = " "
        }
        
        if let gRow = gRow, let gCol = gCol {
            grid[gRow][gCol] = " "
        }
    }
    
    func placePT() {
        // Generate random positions for 'P' and 'G' ensuring they are not in the same row and column.
        repeat {
            pRow = Int.random(in: 0..<numRows)
            pCol = Int.random(in: 0..<numCols)
            gRow = Int.random(in: 0..<numRows)
            gCol = Int.random(in: 0..<numCols)
        } while pRow == gRow || pCol == gCol
        
        // Update the grid with 'P' and 'T'.
        grid[pRow!][pCol!] = "👮🏾"
        grid[gRow!][gCol!] = "🤠"
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
