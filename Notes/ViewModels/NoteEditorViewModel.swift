import Foundation
import SwiftUI
import SwiftData

@MainActor
class NoteEditorViewModel: ObservableObject {
    
    private var modelContext: ModelContext
    
    init(modelContext: ModelContext) {
        self.modelContext = modelContext
    }
    
    @Published var currentNote: Note = Note()
    @Published var isPresentingNoteListView = false

    func saveNote() {
        guard !currentNote.title.isEmpty || !currentNote.text.isEmpty else { return }

        do {
            let currentNoteId = currentNote.id
            let fetchDescriptor = FetchDescriptor<Note>(predicate: #Predicate { $0.id == currentNoteId })
            if let existingNote = try modelContext.fetch(fetchDescriptor).first {
                existingNote.title = currentNote.title
                existingNote.text = currentNote.text
                existingNote.modifiedDate = Date()
            } else {
                currentNote.modifiedDate = Date()
                modelContext.insert(currentNote)
            }
            
            try modelContext.save()
        } catch {
            print("Error saving note: \(error)")
        }
    }
    
    func removeNote(id: UUID) {
        do {
            let fetchDescriptor = FetchDescriptor<Note>(predicate: #Predicate { $0.id == id })
            if let noteToDelete = try modelContext.fetch(fetchDescriptor).first {
                modelContext.delete(noteToDelete)
            }
        } catch {
            print("Error deleting note: \(error)")
        }
    }
    
    func createNewNote() {
        currentNote = Note()
    }
}
