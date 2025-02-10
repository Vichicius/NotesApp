//
//  NoteViewModel.swift
//  Notes
//
//  Created by Luis Martinez on 10/2/25.
//

import Foundation
import SwiftUI

class NoteListViewModel: ObservableObject {
    @Published var currentNote: Note = Note()
    @Published var notes: [Note] = []

    @Published var isPresentingNoteListView = false

    func saveNote() {
        notes.append(currentNote)
    }
    
    func removeNote(id: UUID) {
        notes.removeAll { $0.id == id }
    }
    
    func createNewNote() {
        currentNote = Note()
    }
    
}
