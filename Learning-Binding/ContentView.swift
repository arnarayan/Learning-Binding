//
//  ContentView.swift
//  Learning-Binding
//
//  Created by Anand Narayan on 2024-01-18.
//

import SwiftUI
import RealmSwift

struct Props {
    let counter: Int
    let onIncrement: () -> Void
    let onDecrement: () -> Void
    let onAddValue: () -> Void
}

struct ContentView: View {
    
    @State private var taskName: String = ""
    @State private var addActionValue: Int = 0
    @State private var prioritySetting: PriorityEnum = .medium
    
    @State var isOn = false
    @State var batteryIsOn = false
    @Environment(\.realm) var myValue
    @EnvironmentObject var store: Store_
    
    @ObservedResults(Task.self) var savedEntities: Results<Task>
    @ObservedResults(Note.self) var saveedNotes: Results<Note>
    
    var body: some View {
        
        let props = map(store.state)
        
        NavigationView {
            VStack {
                Text("\(props.counter)")
                TextField(text: $taskName) {
                    Text("Enter Task")
                }
                Picker("Priority", selection: $prioritySetting) {
                    ForEach(PriorityEnum.allCases, id: \.self) { priority in
                        Text(priority.rawValue)
                    }
                }.pickerStyle(.segmented)
                HStack {
                    Button {
                        props.onIncrement()
                    }label: {
                        Text("Increment")
                    }
                    Button {
                        props.onDecrement()
                    }label: {
                        Text("Decrement")
                    }
                    
                }
                HStack {
                    Button {
                        props.onAddValue()
                    }label: {
                        Text("Add It!")
                    }
                    Stepper("Value: \(addActionValue)", value: $addActionValue, in: 1...12)
                }

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
                TodoListView(savedEntities: $savedEntities, savedNotes: $saveedNotes)
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
    
    func map(_ state: State_) -> Props {
        return Props(counter: state.counter,
        onIncrement: {
            store.dispatch(action: IncrementAction())
        },
         onDecrement: {
             store.dispatch(action: DecrementAction())
         },
         onAddValue: {
            store.dispatch(action: AddAction(value: self.addActionValue ))
         }
        )
    }

}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
