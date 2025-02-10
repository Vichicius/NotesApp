//
//  NoteListView.swift
//  Notes
//
//  Created by Luis Martinez on 10/2/25.
//

import Foundation
import SwiftUI
import SwiftData

struct NoteListView: View {
    
    @Query var notes: [Note]
    var viewModel: NoteEditorViewModel

    var body: some View {
        List {
            ForEach(notes.sorted { $0.modifiedDate > $1.modifiedDate }) { note in
                NoteListRowView(note: note)
                    .onTapGesture {
                        viewModel.currentNote = note
                        viewModel.isPresentingNoteListView = false
                    }
            }
            .onDelete { IndexSet in
                if let index = IndexSet.first {
                    let notes = notes.sorted { $0.modifiedDate > $1.modifiedDate }
                    let noteId = notes[index].id
                    viewModel.removeNote(id: noteId)
                }
            }
        }
    }
}

struct NoteListRowView: View {
    var note: Note
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(note.title.isEmpty ? "Title" : note.title)
                .font(.title)
                .bold()
                .lineLimit(1)

            Text(note.text)
                .font(.body)
                .lineLimit(2)
        }
    }
    
}
