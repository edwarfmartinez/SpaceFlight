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
    
    
    var body: some View {
        ZStack{
            NavigationView {
                List(networkManager.fields) { field in
                    var scrollIndicator = networkManager.fields[K.regsPerPage - 2].id
                    NavigationLink(destination: ArticlesDetailView(field: field)) {
                        HStack {
                            AsyncImage(
                                url: URL(string: field.imageURL)!,
                               placeholder: {
                                Text("Loading ...") },
                               image: { Image(uiImage: $0).resizable() }
                            )
                            .frame(width: 150, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            Text(field.title)
                        }
                    }
                    .onAppear {
                        //Fetch data if scroll reaches view's end (Endless scroll))
                        scrollIndicator = networkManager.fields[networkManager.fields.count - 2].id
                        print("\(field.id) - \(scrollIndicator)")
                        if field.objectId == scrollIndicator {
                            networkManager.startIndex += K.regsPerPage
                           
                            networkManager.fetchData(start: networkManager.startIndex, urlPath: K.url.pathArticles)
                        }
                    }
                }.navigationBarTitle(K.tabs.titleArticles)
            }
            if networkManager.isLoading{
                LoadingView()
            }
        }
    }
    
    init() {
                networkManager.fetchData(start: networkManager.startIndex, urlPath: K.url.pathArticles)
        }
}



struct ArticlesView_Previews: PreviewProvider {
    static var previews: some View {
        ArticlesView()
    }
}


