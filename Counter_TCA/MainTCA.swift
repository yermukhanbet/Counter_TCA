//
//  MainTCA.swift
//  Counter_TCA
//
//  Created by Yessen Yermukhanbet on 2022/08/24.
//

import Foundation
import ComposableArchitecture

struct MainState: Equatable {
  var count = 0
  var alert: AlertState<MainState>?
}

enum MainAction: Equatable {
  case increase
  case decrease
  case numberChanged
  case showPopup
}

struct MainEnvironment {
}

let mainReducer = Reducer<MainState, MainAction, MainEnvironment> { state, action, environment in
  switch action {
  case .increase:
    state.count += 1
    return .none
  case .decrease:
    state.count -= 1
    return .task {
      .numberChanged
    }
  case .numberChanged:
    guard state.count == 3 else {
      return .task {
        .showPopup
      }
    }
    return .none
  case .showPopup:
    state.alert = AlertState(title: .init("You got it!"))
    return .none
  }
}
