//
//  TodoListView.swift
//  Learning-Binding
//
//  Created by Anand Narayan on 2024-01-23.
//

import SwiftUI
import RealmSwift

struct TodoListView: View {
    
    @ObservedResults var savedEntities: Results<Task>
    @ObservedResults var savedNotes: Results<Note>
    @Environment(\.realm) var realm
    
    var pendingTasks: [Task] {
        savedEntities.filter {$0.isCompleted == false}
    }
    
    var completedTasks: [Task] {
        savedEntities.filter {$0.isCompleted == true}
    }
    
    var body: some View {
        List {
                ForEach(SectionsEnum.allCases, id: \.self) { sec in
                    
                    Section {
                        
                        let filteredTask = sec == .pending ? pendingTasks : completedTasks
                        
                        if (filteredTask.isEmpty) {
                            Text("No tasks.")
                        }
                        
                        ForEach(filteredTask, id: \.id) { selectedTask in
                            TaskCellView(selectedTask: selectedTask)
                        }.onDelete { indexSet in
                            
                            indexSet.forEach { index in
                                let task = filteredTask[index]
                                
                                for note in task.notes {
                                    $savedNotes.remove(note)
                                }
                                
                                $savedEntities.remove(task)
                                

                                
                                
                            }
                            
                        }
                    } header: {
                        Text(sec.rawValue)
                    }
            }
        }.listStyle(.plain)
    }
    

}


