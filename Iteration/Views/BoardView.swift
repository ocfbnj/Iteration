//
//  BoardView.swift
//  Iteration
//
//  Created by ocfbnj on 2022/3/27.
//

import SwiftUI

struct BoardView: View {
    @ObservedObject var board: Board
    var action: (() -> Void)? = nil
    
    var body: some View {
        VStack(spacing: 1) {
            ForEach(0..<board.row, id: \.self) { i in
                HStack(spacing: 1) {
                    ForEach(0..<board.column, id: \.self) { j in
                        Rect(isPressed: board.data[i][j])
                            .onTapGesture {
                                board.flip(i: i, j: j)
                                action?()
                            }
                    }
                }
            }
        }
        .aspectRatio(contentMode: .fit)
        .border(.black, width: 1)
        .background(.black)
        .padding()
    }
}

struct BoardView_Previews: PreviewProvider {
    static var previews: some View {
        BoardView(board: Board(row: 4, column: 4))
    }
}
