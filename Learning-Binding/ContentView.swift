//
//  ContentView.swift
//  Learning-Binding
//
//  Created by Anand Narayan on 2024-01-18.
//

import SwiftUI
import RealmSwift

struct ContentView: View {
    
    @State private var taskName: String = ""
    @State private var prioritySetting: PriorityEnum = .medium
    
    @State var isOn = false
    @State var batteryIsOn = false
    @Environment(\.realm) var myValue
    @ObservedResults(Task.self) var savedEntities: Results<Task>
    
    var body: some View {
        
        NavigationView {
            VStack {
                TextField(text: $taskName) {
                    Text("Enter Task")
                }
                Picker("Priority", selection: $prioritySetting) {
                    ForEach(PriorityEnum.allCases, id: \.self) { priority in
                        Text(priority.rawValue)
                    }
                }.pickerStyle(.segmented)
                Button {
                    let task = Task()
                    task.title = self.taskName
                    task.priority = self.prioritySetting
                    $savedEntities.append(task)
                    self.taskName = ""
                } label: {
                    Text("Save")
                }.buttonStyle(.borderedProminent)
                Spacer()
                TodoListView(savedEntities: $savedEntities)
            }.padding().navigationTitle("Tasks")
        }
        
        
        

        //Text("Notifications: \(isOn ? "Enabled" : "Disabled")")
//        if !batteryIsOn {
//            Text("Battery life: 100%")
//        }
//
//
//
//        SettingsRowView(imageName: "bell.circle.fill", title: "Notifications", isOn: $isOn)
//        SettingsRowView(imageName: "battery.100.circle.fill", title: "Battery Life", isOn: $batteryIsOn)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
