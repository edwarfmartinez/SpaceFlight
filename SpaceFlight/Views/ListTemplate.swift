//
//  MainView.swift
//  SpaceFlight
//
//  Created by EDWAR FERNANDO MARTINEZ CASTRO on 29/07/22.
//

import SwiftUI

struct ListTemplate: View {
    var fields: Fields
    var networkManager: NetworkManager
    var navigationBarTitle: String
    var urlPath: String
    
    var body: some View {
        NavigationView {
            List(fields) { field in
                ZStack{
                    RoundedRectangle(cornerRadius: 12)
                        .fill(K.Colors.brandPurple)
                    RowData(field: field, urlPath: urlPath)
                        .padding()
                }
                .listRowBackground(K.Colors.brandDarkBlue)
                .onAppear {
                    networkManager.infiniteScrollValidation(fieldId: field.id, urlPath: urlPath)
                }
            }
            .navigationBarTitle(navigationBarTitle)
            .listStyle(.plain)
            .foregroundColor(Color.white)
        }
        .onAppear {
            let appearance = UINavigationBarAppearance()
            appearance.backgroundEffect = UIBlurEffect(style: .systemUltraThinMaterial)
            appearance.backgroundColor = UIColor(K.Colors.brandDarkBlue.opacity(0.8))
            //UIColor(K.Colors.brandDarkBlue)
            appearance.titleTextAttributes = [.foregroundColor : UIColor.white]
            
            
            appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    
            
            
            // Inline appearance (standard height appearance)
            UINavigationBar.appearance().standardAppearance = appearance
            // Large Title appearance
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
        }
    }
}



struct ListTemplate_Previews: PreviewProvider {
    static let networkManager = NetworkManager()
    static var previews: some View {
        ListTemplate(fields: networkManager.fieldsArticles, networkManager: networkManager,
                     navigationBarTitle: K.tabs.titleArticles, urlPath: K.url.pathArticles)
    }
}
