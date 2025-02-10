//
//  NotesApp.swift
//  Notes
//
//  Created by Luis Martinez on 9/2/25.
//

import SwiftUI

@main
struct NotesApp: App {
    
    @StateObject private var noteListViewModel = NoteListViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(noteListViewModel)
        }
    }
}
