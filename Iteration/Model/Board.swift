//
//  Board.swift
//  Iteration
//
//  Created by ocfbnj on 2022/3/27.
//

import Foundation

final class Board: ObservableObject {
    @Published var data: [[Bool]] = []
    
    var row: Int {
        data.count
    }
    
    var column: Int {
        data.first?.count ?? 0
    }
    
    init() {
        reset(row: 0, column: 0)
    }
    
    init(row: Int, column: Int) {
        reset(row: row, column: column)
    }
    
    func reset(row: Int, column: Int) {
        data = Array(repeating: Array(repeating: false, count: column), count: row)
    }
    
    func flip(i: Int, j: Int) {
        for next in [(-1, 0), (1, 0), (0, 0), (0, -1), (0, 1)] {
            let x = i + next.0
            let y = j + next.1
            
            if x >= 0 && x < row && y >= 0 && y < column {
                data[x][y].toggle()
            }
        }
    }
}
