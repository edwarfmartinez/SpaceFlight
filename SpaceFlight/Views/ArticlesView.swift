//
//  MainView.swift
//  SpaceFlight
//
//  Created by EDWAR FERNANDO MARTINEZ CASTRO on 29/07/22.
//

import SwiftUI
import Combine

struct ArticlesView: View {
    @ObservedObject var networkManager = NetworkManager()
    
    init() {
        networkManager.fetchData(
            start: networkManager.startIndex,
            urlPath: K.url.pathArticles)
    }
    
    var body: some View {
        ZStack{
            ListTemplate(
                fields: networkManager.fieldsArticles,
                networkManager: networkManager,
                navigationBarTitle: K.tabs.titleArticles,
                urlPath: K.url.pathArticles
            )
            if networkManager.isLoading{
                LoadingView()
            }
        }
    }
}

struct ArticlesView_Previews: PreviewProvider {
    static var previews: some View {
        ArticlesView()
    }
}

