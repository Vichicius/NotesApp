//
//  NoteTitleView.swift
//  Notes
//
//  Created by Luis Martinez on 10/2/25.
//

import SwiftUI

struct NoteTitleView: View {
    
    @EnvironmentObject var noteListViewModel: NoteListViewModel

    @Binding var titleInput: String
    
    var body: some View {
        ZStack(alignment: .leading) {
            
            TextEditor(text: $titleInput)
                .font(.title)
                .bold()
                .frame(minHeight: 50)
                .fixedSize(horizontal: false, vertical: true)
                .onChange(of: titleInput) {
                    noteListViewModel.saveNote()
                }

            Text(titleInput.isEmpty ? "Title" : " ")
                .padding(.leading, 5)
                .font(.title)
                .bold()
            
        }
    }
}

#Preview {
    NoteTitleView(titleInput: .constant("Title"))
}
