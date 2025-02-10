//
//  Note.swift
//  Notes
//
//  Created by Luis Martinez on 10/2/25.
//

import SwiftUI
import SwiftData
 
@Model
class Note {
    @Attribute(.unique) var id: UUID = UUID()
    var modifiedDate: Date = Date()
    var title: String
    var text: String
    
    init(title: String = "", text: String = "") {
        self.title = title
        self.text = text
    }
}
