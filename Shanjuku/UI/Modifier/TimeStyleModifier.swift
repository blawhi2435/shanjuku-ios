//
//  Modifier.swift
//  Shanjuku
//
//  Created by 張家睿 on 2024/2/8.
//

import SwiftUI

struct TimeStyle: ViewModifier {
    func body(content: Content) -> some View {
        return content
            .font(.callout)
            .padding(1)
    }
}

extension View {
    func timeStyle() -> some View {
        return self.modifier(TimeStyle())
    }
}

#Preview("TimeStyle", traits: .sizeThatFitsLayout) {
    Text("09:00")
        .timeStyle()
}
