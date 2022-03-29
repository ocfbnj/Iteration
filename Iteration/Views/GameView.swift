//
//  GameView.swift
//  Iteration
//
//  Created by ocfbnj on 2022/3/27.
//

import SwiftUI

struct GameView: View {
    @State var win = false
    @StateObject var board: Board
    
    var targetBoard = Board()
    
    var body: some View {
        if win {
            VStack {
                Text("You Have Win The Game!")
                    .font(.title)
                    .bold()
                    .navigationTitle("Iteration")
                .navigationBarTitleDisplayMode(.inline)
                
                Button(action: {
                    generateTargetBoard()
                }, label: {
                    Text("Play it again!").buttonStyle()
                })
            }
        } else {
            VStack(spacing: 80) {
                BoardView(board: board) {
                    if board.data.elementsEqual(targetBoard.data) {
                        DispatchQueue.main.asyncAfter(deadline: .now() +  1.5) {
                            win = true
                        }
                    }
                }
                
                VStack {
                    BoardView(board: targetBoard)
                        .frame(width: 150, height: 150)
                        .disabled(true)
                    Text("Target Board")
                }
                
            }
            .navigationTitle("Black And White Iteration")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                generateTargetBoard()
            }
        }
    }
    
    func generateTargetBoard() {
        let row = board.row
        let column = board.column
        
        board.reset(row: row, column: column)
        targetBoard.reset(row: row, column: column)
        
        for _ in 0..<row * column {
            let i = Int.random(in: 0..<row)
            let j = Int.random(in: 0..<column)
            
            if Bool.random() {
                targetBoard.flip(i: i, j: j)
            }
        }
        
        win = false
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(win: false, board: Board(row: 4, column: 4))
        GameView(win: true, board: Board(row: 4, column: 4))
    }
}
