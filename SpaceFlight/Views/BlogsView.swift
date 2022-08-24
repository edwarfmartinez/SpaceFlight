//
//  MainView.swift
//  SpaceFlight
//
//  Created by EDWAR FERNANDO MARTINEZ CASTRO on 29/07/22.
//

import SwiftUI
import Combine

struct BlogsView: View {
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        ZStack{
            ListTemplate(
                fields: networkManager.fieldsBlogs,
                networkManager: networkManager,
                navigationBarTitle: K.tabs.titleBlogs,
                urlPath: K.url.pathBlogs)
            
            if networkManager.isLoading{
                LoadingView()
            }
        }
    }
    
    init() {
        networkManager.fetchData(start: networkManager.startIndex, urlPath: K.url.pathBlogs)
    }
}

struct BlogsView_Previews: PreviewProvider {
    static var previews: some View {
        BlogsView()
    }
}

