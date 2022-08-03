//
//  ArticlesDetailView.swift
//  SpaceFlight
//
//  Created by EDWAR FERNANDO MARTINEZ CASTRO on 31/07/22.
//

import SwiftUI

struct ArticlesDetailView: View {
    let field: Field

    var body: some View {
        VStack{
            Text("\(field.title)")
            AsyncImage(
                url: URL(string: field.imageURL)!,
               placeholder: {
                Text("Loading ...") },
               image: { Image(uiImage: $0).resizable() }
            )
            .frame(width: 150, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            Text("\(field.summary)")
            Text("\(field.url)")
            Text("\(field.publishedAt)")
        }
    }
}

struct ArticlesDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ArticlesDetailView(field: Field(id: 0, title: "", url: "", imageURL: "", newsSite: "", summary: "", publishedAt: "", updatedAt: ""))
    }
}
