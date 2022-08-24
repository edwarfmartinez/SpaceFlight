//
//  ContentView.swift
//  SpaceFlight
//
//  Created by EDWAR FERNANDO MARTINEZ CASTRO on 27/07/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
            TabView {
            ArticlesView().tabItem {
                Label(K.tabs.titleArticles, systemImage: K.tabs.imageArticles)
            }
            BlogsView().tabItem {
                Label(K.tabs.titleBlogs, systemImage: K.tabs.imageBlogs)
            }
            NasaReportsView().tabItem {
                Label(K.tabs.titleNasaReports, systemImage: K.tabs.imageNasaReports)
            }
        }.accentColor(.white)
    }
    init() {
        UITabBar.appearance().barTintColor = UIColor(K.Colors.brandDarkBlue)
       //UITabBar.appearance().isTranslucent = false
        UITabBar.appearance().unselectedItemTintColor = UIColor(K.Colors.brandLightPurple)
        
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


