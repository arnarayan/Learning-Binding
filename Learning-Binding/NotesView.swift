//
//  NotesView.swift
//  Learning-Binding
//
//  Created by Anand Narayan on 2024-01-27.
//

import SwiftUI
import RealmSwift

struct NotesView: View {
    
    
    @State var notes: String = ""
    @ObservedRealmObject var task: Task
    //@Environment(\.realm) var realm
    
    var body: some View {
        VStack {
            TextField("Note", text: $notes)
            Button {
                
                    let note = Note()
                    note.text = self.notes
                    $task.notes.append(note)
                
                notes = ""
            } label: {
                Text("Save Note")
            }
            
            List {
                ForEach(task.notes) { note in
                    Text(note.text)
                }.onDelete(perform: $task.notes.remove)
            }
            
        }
    }
}

