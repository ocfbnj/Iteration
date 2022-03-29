//
//  View+Modifier.swift
//  Iteration
//
//  Created by ocfbnj on 2022/3/29.
//

import SwiftUI

struct Title: ViewModifier {
    var width: CGFloat? = nil
    
    func body(content: Content) -> some View {
        if let width = width {
            content
                .font(.system(size: 32))
                .foregroundColor(.white)
                .padding([.top, .bottom], 16)
                .frame(width: width)
                .background(.black)
                .cornerRadius(32)
        } else {
            content
                .font(.system(size: 32))
                .foregroundColor(.white)
                .padding([.top, .bottom], 16)
                .padding([.leading, .trailing], 32)
                .background(.black)
                .cornerRadius(32)
        }
    }
}

extension View {
    func buttonStyle(width: CGFloat? = nil) -> some View {
        modifier(Title(width: width))
    }
}
