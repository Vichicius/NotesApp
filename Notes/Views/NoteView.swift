//
//  ContentView.swift
//  Notes
//
//  Created by Luis Martinez on 9/2/25.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = NoteListViewModel()
    
    @State var isPresentingNoteListView = false
        
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    NoteTitleView(titleInput: $viewModel.titleInput)
                    
                    NoteTextView(textInput: $viewModel.textInput)
                    
                }
                .padding()
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Notes App 📝")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        isPresentingNoteListView = true
                    }) {
                        Label("Note list", systemImage: "line.horizontal.3")
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        // Save current note and create a new one
                    }) {
                        Label("Add note", systemImage: "square.and.pencil")
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        // Delete current note and create a new one
                    }) {
                        Label("Remove note", systemImage: "trash")
                    }
                }
            }
            .sheet(isPresented: $isPresentingNoteListView) {
                NoteListView()
                    .presentationDragIndicator(.visible)
                    .presentationDetents([.medium, .large])
            }

        }
    }
}

#Preview {
    ContentView()
}

