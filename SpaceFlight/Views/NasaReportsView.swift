//
//  MainView.swift
//  SpaceFlight
//
//  Created by EDWAR FERNANDO MARTINEZ CASTRO on 29/07/22.
//

import SwiftUI

struct NasaReportsView: View {
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        ZStack{
            ListTemplate(
                fields: networkManager.fieldsNasaReports,
                networkManager: networkManager,
                navigationBarTitle: K.tabs.titleNasaReports,
                urlPath: K.url.pathNasaReports)
            if networkManager.isLoading{
                LoadingView()
            }
        }
    }
    
    init() {
        networkManager.fetchData(start: networkManager.startIndex, urlPath: K.url.pathNasaReports)
    }
}

struct NasaReportsView_Previews: PreviewProvider {
    static var previews: some View {
        NasaReportsView()
    }
}

