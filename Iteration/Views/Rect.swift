//
//  Rect.swift
//  Iteration
//
//  Created by ocfbnj on 2022/3/27.
//

import SwiftUI

struct Rect: View {
    var isPressed: Bool
    
    var body: some View {
        Rectangle().foregroundColor(isPressed ? .black : .white)
    }
}

struct Rect_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Rect(isPressed: false)
            Rect(isPressed: true)
        }
        .previewLayout(.fixed(width: 40, height: 40))
    }
}
