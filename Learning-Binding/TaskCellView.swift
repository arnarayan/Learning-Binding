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
    var body: some View {
        VStack(alignment: .leading) {
            Toggle(isOn: $selectedTask.isCompleted) {
                Text("\(selectedTask.title)").font(.subheadline)
                Text(selectedTask.priority.rawValue)
                    .padding(6)
                    .frame(width: 75)
                    .background(priorityBackground(priority: selectedTask.priority))
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
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

