//
//  MainView.swift
//  Counter_TCA
//
//  Created by Yessen Yermukhanbet on 2022/08/24.
//

import SwiftUI
import ComposableArchitecture

struct MainView: View {
  
  let store: Store<MainState, MainAction>
  
  var body: some View {
    WithViewStore(self.store) { store in
      VStack {
        Spacer()
        Text("\(store.count)")
        Spacer()
        HStack {
          Button {
            store.send(.increase)
          } label: {
            Text("Increase")
          }
          Spacer()
          Button {
            store.send(.decrease)
          } label: {
            Text("Decrease")
          }
        }
      }
    }
  }
}

struct MainView_Previews: PreviewProvider {
  static var previews: some View {
    MainView(store: Store(initialState: MainState(),
                          reducer: mainReducer,
                          environment: MainEnvironment()))
  }
}
