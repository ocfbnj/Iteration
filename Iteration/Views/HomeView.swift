//
//  HomeView.swift
//  Iteration
//
//  Created by ocfbnj on 2022/3/28.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 120) {
                Text("Iteration")
                    .font(.system(size: 64))
                    .bold()
                    .lineLimit(1)
                    .padding(40)
                
                VStack {
                    Group {
                        NavigationLink(destination: {
                            GameView(board: Board(row: 3, column: 3))
                        }, label: {
                            Text("Easy").buttonStyle(width: 300)
                        })
                        
                        NavigationLink(destination: {
                            GameView(board: Board(row: 6, column: 6))
                        }, label: {
                            Text("Medium").buttonStyle(width: 300)
                        })
                        
                        NavigationLink(destination: {
                            GameView(board: Board(row: 9, column: 9))
                        }, label: {
                            Text("Hard").buttonStyle(width: 300)
                        })
                    }
                }
            }
            .navigationTitle("Iteration")
            .navigationBarHidden(true)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
