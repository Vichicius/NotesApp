//
//  NoteEditorView.swift
//  Notes
//
//  Created by Luis Martinez on 9/2/25.
//

import SwiftUI
import SwiftData

struct NoteEditorView: View {
    
    @EnvironmentObject var viewModel: NoteEditorViewModel
    
    @Query var notes: [Note]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    NoteTitleView(titleInput: $viewModel.currentNote.title, noteListViewModel: viewModel)
                    NoteTextView(textInput: $viewModel.currentNote.text, noteListViewModel: viewModel)
                }
                .padding()
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Notes App 📝")
            .toolbarBackground(.yellow)
            .toolbarBackgroundVisibility(.visible, for: .navigationBar)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        viewModel.isPresentingNoteListView = true
                    }) {
                        Label("Note list", systemImage: "line.horizontal.3")
                            .foregroundStyle(.black, .black)
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        // Save current note and create a new one
                        viewModel.saveNote()
                        viewModel.createNewNote()
                    }) {
                        Label("Add note", systemImage: "square.and.pencil")
                            .foregroundStyle(.black, .black)
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        // Delete current note and create a new one
                        viewModel.removeNote(id: viewModel.currentNote.id)
                        viewModel.createNewNote()
                    }) {
                        Label("Remove note", systemImage: "trash")
                            .foregroundStyle(.red, .red)
                    }
                }
            }
            .sheet(isPresented: $viewModel.isPresentingNoteListView) {
                NoteListView(viewModel: viewModel)
                    .presentationDragIndicator(.visible)
                    .presentationDetents([.medium, .large])
            }

        }
    }
}

#Preview {
    NoteEditorView()
}

