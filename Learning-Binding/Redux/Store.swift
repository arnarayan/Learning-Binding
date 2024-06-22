//
//  Store.swift
//  Learning-Binding
//
//  Created by Anand Narayan on 2024-06-07.
//

import Foundation


typealias Reducer = (_ state: State_, _ action: Action) -> State_



struct State_ {
    var counter: Int = 0
}




protocol Action {}

struct IncrementAction: Action
{
    
}

struct DecrementAction: Action
{
    
}

struct AddAction: Action {
    let value: Int
    
}



internal func reducer(state: State_, action: Action) -> State_ {
    var state = state
    
    switch action {
    case _ as IncrementAction:
        state.counter += 1
    case let action as AddAction:
        state.counter += action.value
    case _ as DecrementAction:
        state.counter -= 1
    default:
        break
    }

    return state
}

class Store_: ObservableObject {
    
    var reducer: Reducer
    @Published var state: State_
    
    init(reducer: @escaping Reducer, state: State_ = State_()) {
        self.reducer = reducer
        self.state = state
    }
    
    func dispatch(action: Action) {
        state = reducer(state, action)
    }
    
}
