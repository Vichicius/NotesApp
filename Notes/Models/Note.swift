//
//  Note.swift
//  Notes
//
//  Created by Luis Martinez on 10/2/25.
//

import SwiftUI

class Note: Identifiable {
    var id = UUID()
    var title: String
    var text: String
    
    init(title: String, text: String) {
        self.title = title
        self.text = text
    }
}

