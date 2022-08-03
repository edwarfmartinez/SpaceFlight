//
//  ContentView.swift
//  SpaceFlight
//
//  Created by EDWAR FERNANDO MARTINEZ CASTRO on 27/07/22.
//

import SwiftUI

struct ContentView: View {
    //@StateObject var networkManager = NetworkManager()

    //@ObservedObject var networkManager = NetworkManager()
    //@State var startIndex = 0
    
    var body: some View {
        TabView {
            ArticlesView().tabItem {
                Label("Articles", systemImage: "list.dash")
            }
            
            BlogsView().tabItem {
                Label("Blogs", systemImage: "list.dash")
            }
            
            NasaReportsView().tabItem {
                Label("Nasa Reports", systemImage: "list.dash")
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
