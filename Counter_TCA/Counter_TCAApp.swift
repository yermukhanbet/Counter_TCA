//
//  Counter_TCAApp.swift
//  Counter_TCA
//
//  Created by Yessen Yermukhanbet on 2022/08/24.
//

import SwiftUI
import ComposableArchitecture

@main
struct Counter_TCAApp: App {
    var body: some Scene {
        WindowGroup {
          MainView(store: Store(initialState: MainState(),
                                reducer: mainReducer,
                                environment: MainEnvironment()
                               )
                   )
        }
    }
}
