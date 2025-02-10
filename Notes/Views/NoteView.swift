//
//  ContentView.swift
//  Notes
//
//  Created by Luis Martinez on 9/2/25.
//

import SwiftUI

struct ContentView: View {
    
    @State var currentNote: Note?
    @State var titleInput: String = ""
    @State var textInput: String = ""
    @State var notes: [Note] = []
    
    @State var isPresentinNoteListView = false
        
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    NoteTitleView(titleInput: $titleInput)
                    
                    NoteTextView(textInput: $textInput)
                    
                }
                .padding()
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Notes App 📝")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        isPresentinNoteListView = true
                    }) {
                        Label("Note list", systemImage: "line.horizontal.3")
                    }
                }
            }
            .sheet(isPresented: $isPresentinNoteListView) {
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

