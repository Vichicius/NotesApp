//
//  ContentView.swift
//  Notes
//
//  Created by Luis Martinez on 9/2/25.
//

import SwiftUI

struct ContentView: View {
    
    @State var titleInput: String = ""
    @State var textInput: String = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            NoteTitleView(titleInput: $titleInput)
            
            NoteTextView(textInput: $textInput)
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

struct NoteTitleView: View {
    @Binding var titleInput: String
    var body: some View {
        ZStack(alignment: .leading) {
            
            TextEditor(text: $titleInput)
                .font(.title)
                .bold()
                .fixedSize(horizontal: false, vertical: true)
            
            Text(titleInput.isEmpty ? "Title" : " ")
                .padding(.leading, 5)
                .font(.title)
                .bold()
            
        }
    }
}

struct NoteTextView: View {
    @Binding var textInput: String
    
    var body: some View {
        ZStack(alignment: .leading) {
            
            TextEditor(text: $textInput)
                .fixedSize(horizontal: false, vertical: true)
                .font(.system(size: 18))
            
            if textInput.isEmpty {
                Text("Start writing a note...")
                    .padding(.leading, 5)
                    .font(.system(size: 18))
            }
            
        }
        .foregroundStyle(.gray)
    }
}
