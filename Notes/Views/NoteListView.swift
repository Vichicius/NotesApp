//
//  NoteListView.swift
//  Notes
//
//  Created by Luis Martinez on 10/2/25.
//

import SwiftUI

struct NoteListView: View {
    
    @State var notes: [Note]
    @EnvironmentObject var viewModel: NoteListViewModel

    var body: some View {
        List(notes) { note in
            NoteListRowView(note: note)
                .onTapGesture {
                    viewModel.currentNote = note
                    viewModel.isPresentingNoteListView = false
                }
        }
    }
}

#Preview {
    NoteListView(notes: [Note(title: "First Note", text: "This is the first note"), Note(title: "Second Note", text: "This is the second note")])
}

struct NoteListRowView: View {
    @State var note: Note
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(note.title)
                .font(.title)
                .bold()
            Text(note.text)
                .font(.body)
        }
    }
    
}
