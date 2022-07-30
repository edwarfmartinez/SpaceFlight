//
//  MainView.swift
//  SpaceFlight
//
//  Created by EDWAR FERNANDO MARTINEZ CASTRO on 29/07/22.
//

import SwiftUI

struct BlogsView: View {
    @ObservedObject var networkManager = NetworkManager()
    @State var startIndex1 = 0
   
    var body: some View {
            NavigationView {
                List(networkManager.fields) { field in
                    var scrollIndicator = networkManager.fields[K.regsPerPage - 2].id
                    //print(networkManager.isLoading)

                    NavigationLink(destination: DetailView(url: field.url)) {
                        HStack {
                            Text(String(field.id))
                            Text(field.title)
                            //Text(field.publishedAt)

                        }
                    }
                    .onAppear {
                        //Fetch data if scroll reaches view's end
                        scrollIndicator = networkManager.fields[networkManager.fields.count - 2].id
                        print("\(field.id) - \(scrollIndicator)")
                        if field.objectId == scrollIndicator {
                            startIndex1 += K.regsPerPage
                            networkManager.fetchData(start: startIndex1, urlPath: K.url.pathBlogs)
                        }
                    }
                }.navigationBarTitle(K.tabs.titleBlogs)
            }
    }
    
    init() {
        networkManager.fetchData(start: startIndex1, urlPath: K.url.pathBlogs)
        }
}

struct BlogsView_Previews: PreviewProvider {
    static var previews: some View {
        BlogsView()
    }
}
