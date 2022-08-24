//
//  RowData.swift
//  SpaceFlight
//
//  Created by EDWAR FERNANDO MARTINEZ CASTRO on 24/08/22.
//

import SwiftUI

struct RowData: View {
    var field: Field
    var urlPath: String
    
    var body: some View {
        
        if urlPath == K.url.pathArticles
        {
            NavigationLink(destination: ArticlesDetailView(field: field)) {
                HStack {
                    AsyncImage(
                        url: URL(string: field.imageURL)!,
                        placeholder: {
                            Image(K.imageLoadingPlaceholder).resizable()
                        },
                        image: { Image(uiImage: $0).resizable() }
                    ).aspectRatio(contentMode: .fit)
                        .frame(width: 100)
                    Text(field.title).id("textArticle")
                    
                }
            }
        }
        else {
            NavigationLink(destination: DetailView(url: field.url)) {
                HStack {
                    Text(field.title)
                }
            }
        }
    }
}
