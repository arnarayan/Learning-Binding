//
//  TaskCellView.swift
//  Learning-Binding
//
//  Created by Anand Narayan on 2024-01-23.
//

import SwiftUI
import RealmSwift

struct TaskCellView: View {
    @ObservedRealmObject var selectedTask: Task
    @Environment(\.realm) var realm
    @State private var isChecked: Bool = false
    
    var body: some View {
        
        NavigationLink {
            NotesView(task: selectedTask)
        } label: {
            HStack {
                Toggle(isOn: $selectedTask.isCompleted) {
                    Text("\(selectedTask.title)").font(.subheadline)
                    Spacer()
                    Text(selectedTask.priority.rawValue)
                        .padding(6)
                        .frame(width: 75)
                        .background(priorityBackground(priority: selectedTask.priority))
                        .foregroundColor(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
                }.toggleStyle(CheckboxToggleStyle(selectedTask: self.selectedTask, realm: self._realm))
            }

            
            

        }

        

    }
    
    private func priorityBackground(priority: PriorityEnum) -> Color {
        switch priority {
            case PriorityEnum.low: return Color.blue
            case PriorityEnum.medium: return Color.orange
            case PriorityEnum.high: return Color.red
        }
    }
}

struct CheckboxToggleStyle: ToggleStyle {
    @ObservedRealmObject var selectedTask: Task
    @Environment(\.realm) var realm
    
    
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            Image(systemName: configuration.isOn ? "checkmark.square" : "square")
                .resizable()
                .frame(width: 20, height: 20)
                .onTapGesture {
                    try! realm.write {
                        selectedTask.thaw()!.isCompleted.toggle()
                    }
                }
            configuration.label
            

        }
    }
}
