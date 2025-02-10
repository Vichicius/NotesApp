//
//  NoteTitleView.swift
//  Notes
//
//  Created by Luis Martinez on 10/2/25.
//

import SwiftUI

struct NoteTitleView: View {
    
    @Binding var titleInput: String
    
    var body: some View {
        ZStack(alignment: .leading) {
            
            TextEditor(text: $titleInput)
                .font(.title)
                .bold()
                .fixedSize(horizontal: false, vertical: true)
            
            Text(titleInput.isEmpty ? "Title" : " ")
                .padding(.leading, 5)
                .font(.title)
                .bold()
            
        }
    }
}
