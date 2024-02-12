//
//  FormText.swift
//  Shanjuku
//
//  Created by 張家睿 on 2024/2/11.
//

import SwiftUI

struct FormText: View {
    let placeholder: String
    
    @Binding var value: String
    var body: some View {
        VStack {
            TextField(placeholder, text: $value)
                .padding(.leading, 16)
                .padding(.trailing, 16)
            
            Rectangle()
                .frame(height: 1)
                .foregroundColor(.darkGreen)
                .padding(.leading, 16)
                .padding(.trailing, 16)
        }
    }
}

#Preview {
    FormText(placeholder: "Enter some thing", value: .constant(""))
}
