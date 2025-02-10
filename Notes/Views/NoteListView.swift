//
//  NoteListView.swift
//  Notes
//
//  Created by Luis Martinez on 10/2/25.
//

import SwiftUI

struct NoteListView: View {
    
    @State var notes = [Note(title: "First Note", text: "This is the first note"), Note(title: "Second Note", text: "This is the second note")]
    
    var body: some View {
        List(notes) { note in
            VStack(alignment: .leading) {
                Text(note.title)
                    .font(.title)
                    .bold()
                Text(note.text)
                    .font(.body)
            }
        }
    }
}

#Preview {
    NoteListView()
}
