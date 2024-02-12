//
//  FormTextView.swift
//  Shanjuku
//
//  Created by 張家睿 on 2024/2/11.
//

import SwiftUI

struct IconFormText: View {
    let icon: Image
    let label: String
    let placeholder: String
    
    @Binding var value: String
    var body: some View {
        
        HStack {
            
            VStack {
                
            }
        }
    }
}

#Preview {
    IconFormText(icon: Image(systemName: "envelope"), label: "label", placeholder: "enter some thing", value: .constant(""))
}
