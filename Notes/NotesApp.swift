//
//  NotesApp.swift
//  Notes
//
//  Created by Luis Martinez on 9/2/25.
//

import SwiftUI
import SwiftData

@main
struct NotesApp: App {
        
    let modelContainer: ModelContainer
    
    var body: some Scene {
        WindowGroup {
            NoteEditorView()
                .environmentObject(NoteEditorViewModel(modelContext: modelContainer.mainContext))
                .modelContainer(modelContainer)
        }
    }
    
    init() {
        do {
            modelContainer = try ModelContainer(for: Note.self)
        } catch {
            fatalError("Error initializing ModelContext")
        }
    }
}
