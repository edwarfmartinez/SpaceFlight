//
//  ArticlesDetailView.swift
//  SpaceFlight
//
//  Created by EDWAR FERNANDO MARTINEZ CASTRO on 31/07/22.
//

import SwiftUI

struct ArticlesDetailView: View {
    let field: Field
    @State private var isShowingWebView: Bool = false
    @ObservedObject var networkManager = NetworkManager()
    var body: some View {
        ZStack{
            VStack{
                AsyncImage(
                    url: URL(string: field.imageURL)!,
                    placeholder: {Image(K.imageLoadingPlaceholder).resizable()},
                    image: { Image(uiImage: $0).resizable() }
                ).aspectRatio(contentMode: .fit)
                HStack(){
                    Text("\(field.publishedAt)")
                        .frame(maxWidth: .infinity, alignment: .topTrailing)
                    Spacer()
                }.padding()
                Text("\(field.title)")
                    .foregroundColor(.black)
                    .font(.system(size: 25))
                    .bold()
                    .fixedSize(horizontal: false, vertical: true)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                Text("\(field.summary)")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                Button(action: {isShowingWebView = true})
                {Text(K.textDetailLink).foregroundColor(Color.blue)}
                        .sheet(isPresented: $isShowingWebView) {
                            DetailView(url: field.url)
                        }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                Spacer()
                
            }
            if networkManager.isLoading{
                LoadingView()
            }
        }
     
        
    }
}

struct ArticlesDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ArticlesDetailView(field: Field(id: 0, title: "title", url: "url", imageURL: "imageURL", publishedAt: "publishedAt", newsSite: "newsSite", summary: "summary", updatedAt: "updatedAt"))
    }
}
