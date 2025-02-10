//
//  NoteViewModel.swift
//  Notes
//
//  Created by Luis Martinez on 10/2/25.
//

import Foundation
import SwiftUI

class NoteListViewModel: ObservableObject {
    @Published var currentNote: Note?
    @Published var titleInput: String = ""
    @Published var textInput: String = ""
    @Published var notes: [Note] = []

}
