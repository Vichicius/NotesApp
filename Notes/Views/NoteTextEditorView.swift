//
//  NoteTextView.swift
//  Notes
//
//  Created by Luis Martinez on 10/2/25.
//

import SwiftUI

struct NoteTextView: View {
    
    @EnvironmentObject var noteListViewModel: NoteListViewModel
    @Binding var textInput: String
    
    var body: some View {
        ZStack(alignment: .leading) {
            
            TextEditor(text: $textInput)
                .font(.system(size: 18))
                .scrollDisabled(true)
                .frame(minHeight: UIScreen.main.bounds.height - 200)
                .onChange(of: textInput) {
                    noteListViewModel.saveNote()
                }
            
            if textInput.isEmpty {
                VStack {
                    Text("Start writing a note...")
                        .padding(.leading, 5)
                        .padding(.top, 8)
                        .font(.system(size: 18))
                        .foregroundStyle(.gray)

                    Spacer()
                }
            }
        }
    }
}

#Preview {
    @Previewable @State var textInput = ""
    NoteTextView(textInput: $textInput)
}
