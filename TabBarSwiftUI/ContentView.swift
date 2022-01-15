//
//  ContentView.swift
//  TabBarSwiftUI
//
//  Created by Ahmed Elzohry on 10/26/19.
//  Copyright © 2019 Ahmed Elzohry. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  @State private var badgeNumber: Int = 3
  private var badgePosition: CGFloat = 3
  private var tabsCount: CGFloat = 3
  
  var body: some View {
    GeometryReader { geometry in
      ZStack(alignment: .bottomLeading) {
        // TabView
        TabView {
          Text("First View")
            .tabItem {
              Image(systemName: "1.circle")
              Text("First")
          }.tag(0)
          
          Text("Second View")
            .tabItem {
              Image(systemName: "2.circle")
              Text("Second")
          }.tag(1)
          
          Text("Third View")
            .tabItem {
              Image(systemName: "3.circle")
              Text("Third")
          }.tag(2)
        }
        
        // Badge View
        ZStack {
          Circle()
            .foregroundColor(.red)
          
          Text("\(self.badgeNumber)")
            .foregroundColor(.white)
            .font(Font.system(size: 12))
        }
        .frame(width: 20, height: 20)
        .offset(x: ( ( 2 * self.badgePosition) - 1 ) * ( geometry.size.width / ( 2 * self.tabsCount ) ), y: -30)
        .opacity(self.badgeNumber == 0 ? 0 : 1)
      }
      .ignoresSafeArea(.keyboard)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      ContentView()
            
      ContentView().previewDevice("iPhone SE")
    }
  }
}
