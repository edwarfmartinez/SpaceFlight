//
//  LoadingView.swift
//  SpaceFlight
//
//  Created by EDWAR FERNANDO MARTINEZ CASTRO on 2/08/22.
//

import SwiftUI

struct LoadingView: View{
    var body: some View{
        ZStack{
            Color(UIColor(K.Colors.brandDarkBlue))
                .ignoresSafeArea()
            
            ProgressView()
                .progressViewStyle( CircularProgressViewStyle(tint: .white))
                .scaleEffect(3)
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
