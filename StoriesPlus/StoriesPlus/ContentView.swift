//
//  ContentView.swift
//  StoriesPlus
//
//  Created by Andrej Kling on 17.06.21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selection : Tab = .home

    enum Tab {
        
        case home
        case search
        case like
        case person
    }
    
    init() {
        
        UITabBar.appearance().isTranslucent = false
        UITabBar.appearance().barTintColor = UIColor(Color(#colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)))
    }
    
    var body: some View {
        
        ZStack(alignment: .bottom) {
            
            TabView(selection: $selection) {
          
                CardsMainView()
                    .tabItem {
                        Label("", systemImage: "house")
                    }
                    .tag(Tab.home)
                
                Text("")
                    .tabItem {
                        Label("", systemImage: "a.magnify")
                    }
                    .tag(Tab.search)
                
                Spacer().frame(width: 55)
                
                Text("")
                    .tabItem {
                        Label("", systemImage: "heart.circle")
                    }
                    .tag(Tab.home)
                
                Text("")
                    .tabItem {
                        Label("", systemImage: "person.fill.viewfinder")
                    }
                    .tag(Tab.search)
      
            }
            .accentColor(Color.orange)
            .shadow(color: Color.black.opacity(0.1), radius: 1, x: 1, y: 1)
            .shadow(color: Color.black.opacity(0.1), radius: 1, x: -1, y: -1)
            
            Buttons(image: "bag", size: 41, color: Color.orange)
                .padding(.bottom, 21)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Buttons : View {
    
    var image : String
    var size : CGFloat
    var color : Color
    
    var body: some View {
        
        VStack {
            
            Circle()
                .fill(color)
                .frame(width: size, height: size, alignment: .center)
                .overlay(
                    Image(systemName: image)
                        .font(.title3)
                        .foregroundColor(Color.white.opacity(0.8))
                )
        }
    }
}
